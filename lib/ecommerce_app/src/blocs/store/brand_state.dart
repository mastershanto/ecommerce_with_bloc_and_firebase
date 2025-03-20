part of 'brand_bloc.dart';

@immutable
sealed class BrandState extends Equatable{
  const BrandState();
  @override
  List<Object?> get props => [];
}

final class BrandInitial extends BrandState {}

final class BrandFetchSuccessfully extends BrandState {
  final List<BrandModel> brands;
  BrandFetchSuccessfully(this.brands);

  @override
  List<Object?> get props => [brands];
}

final class BrandFetchFailed extends BrandState {
  final String message;
  BrandFetchFailed(this.message);

  @override
  List<Object?> get props => [message];
}