part of 'rating_bloc.dart';

@immutable
sealed class RatingState extends Equatable {
  const RatingState();
  @override
  List<Object> get props=>[];
}

final class RatingInitial extends RatingState {
  final double rating;
  RatingInitial({required this.rating});
  final TextEditingController reviewController=TextEditingController();
  @override
  // TODO: implement props
  List<Object> get props => [reviewController, rating];
}
final class RatingLoading extends RatingState {}
final class RatingSubmitSuccess extends RatingState {}
final class RatingSubmitFailed extends RatingState {
  final String message;
  const RatingSubmitFailed(this.message);
  @override
  List<Object> get props=>[message];
}

final class ReviewFetchSuccess extends RatingState {
  final List<ReviewModel> reviews;
  const ReviewFetchSuccess(this.reviews);
  @override
  List<Object> get props=>[reviews];
}

final class ReviewFetchFailed extends RatingState {
  final String message;
  const ReviewFetchFailed(this.message);
  @override
  List<Object> get props=>[message];
}

final class RatingPointChangedSuccessfully extends RatingState {
  final String ratingPoint;
  RatingPointChangedSuccessfully(this.ratingPoint);
  @override
  List<Object> get props=>[ratingPoint];
}

final class ReviewPhotoAdded extends RatingState{
  final List<File> images;
   ReviewPhotoAdded(this.images);
  @override
  List<Object> get props=>[images];
}

