import 'package:bloc/bloc.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/models.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final StoreRepository repository;
  BrandBloc(this.repository) : super(BrandInitial()) {
    on<RequestFetchBrand>((event, emit) async{
      try{
        final brands=await repository.fetchBrands();
        emit(BrandFetchSuccessfully(brands));
      }catch(e){
        emit(BrandFetchFailed("Failed to  load brands"));
      }
    });
  }
}
