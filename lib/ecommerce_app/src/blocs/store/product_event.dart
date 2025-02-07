part of 'product_bloc.dart';

@immutable
sealed class ProductEvent extends Equatable{


  List<Object?> get props => [];
}
class RequestFetchProduct extends ProductEvent {}