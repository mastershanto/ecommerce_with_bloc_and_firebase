import 'package:bloc/bloc.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/repository/product_repository.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/repository/store_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;
  ProductBloc(this._repository) : super(ProductInitial()) {

    // add(RequestFetchProduct());
    on<RequestFetchProduct>((event, emit) async {
      // if (state is ProductFetchSuccess) return; // Prevent unnecessary re-fetch
      try{
        final products=await _repository.fetchProducts();
        emit(ProductFetchSuccess(products));
      }catch(e){
        emit(ProductFetchFailed("Failed to  load Products"));
      }
    });

    on<RequestFetchSingleProduct>((event, emit) async {
      try{
        final products=await _repository.fetchSingleProduct(event.productId);
        emit(SingleProductFetchSuccess(event.productId, products!));
      }catch(e){
        emit(ProductFetchFailed("Failed to  load Products"));
      }
    });
  }
}
