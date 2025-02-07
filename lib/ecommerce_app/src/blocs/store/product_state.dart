part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {
  const ProductState();
@override
List<Object?> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductFetchSuccess extends  ProductState {
  final List<ProductModel> products;
  ProductFetchSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

final class ProductFetchFailed extends ProductState {
  final String message;
  ProductFetchFailed(this.message);

  @override
  List<Object?> get props => [message];
}