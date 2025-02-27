part of 'rating_bloc.dart';

@immutable
sealed class RatingEvent extends Equatable {
  const RatingEvent();
  @override
  List<Object> get props=>[];
}

final class UpdateRatingPoint extends RatingEvent {
  final double rating;
  const UpdateRatingPoint(this.rating);
  @override
  List<Object> get props=>[rating];
}

final class SubmitReview extends RatingEvent {
  final String review;
  final String productId;
  const SubmitReview(this.review, this.productId);
  @override
  List<Object> get props=>[review, productId];
}