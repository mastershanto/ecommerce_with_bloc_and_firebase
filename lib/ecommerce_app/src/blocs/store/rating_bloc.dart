import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/models/review_model.dart';
import '../../data/repository/product_repository.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  double rating = 0.0;
  final ProductRepository repository;

  RatingBloc(this.repository) : super(RatingInitial(rating: 0.00)) {
    on<UpdateRatingPoint>((event, emit) {
      rating = event.rating;
      emit(RatingPointChangedSuccessfully(rating as String));
    });

    on<RequestAddReview>((event, emit) async {
      emit(RatingInitial(rating: 0.0));
    });

    on<SubmitReview>((event, emit) async {
      emit(RatingLoading());
      final currentUser = FirebaseAuth.instance.currentUser;

      final review = ReviewModel(
          userId:currentUser?.uid,
          userName: currentUser?.displayName,
          userProfilePic: currentUser?.photoURL,
          createdAt: Timestamp.now(),
          productId: event.productId,
          review: event.review,
          rating: rating

      );
      try {
        final response = await repository.submitReviewAndRating(review);

        if (response != null) {
          emit(RatingSubmitSuccess());
        } else {
          emit(const RatingSubmitFailed("Cant submit review"));
        }
      } catch (e) {
        emit(const RatingSubmitFailed("Internal Server Error"));
      }
    });


    on<FetchProductReview>((event, emit) async {
      try {
        final reviews = await repository.fetchProductReviews(event.productId);
        debugPrint("Reviews are: ${reviews}");
        emit(ReviewFetchSuccess(reviews!));
      } catch (e) {
        emit(ReviewFetchFailed("Failed to load reviews: ${e.toString()}"));
      }
    });

    on<RatingPointChanged>((event, emit) async {
      try {
        // emit(RatingPointChangedSuccessfully(event.rating.toString()));
      } catch (e) {
        emit(ReviewFetchFailed("Failed to load reviews: ${e.toString()}"));
      }
    });


  }
}