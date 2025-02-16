part of 'product_bloc.dart';

@immutable
sealed class ProductEvent extends Equatable{


  List<Object?> get props => [];
}
class RequestFetchProduct extends ProductEvent {}
class RequestFetchSingleProduct extends ProductEvent {
   final String productId;
   RequestFetchSingleProduct(this.productId);

  @override
  List<Object?> get props =>[productId];

}