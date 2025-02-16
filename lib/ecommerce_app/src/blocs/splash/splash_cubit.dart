import 'package:bloc/bloc.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial(isLoaded:false));
final StoreRepository _repository=StoreRepository();
  void startSplash() async{
    await _repository.fetchBrands();
    Future.delayed(const Duration(seconds: 2),() async{
      // try{
      // //   await _repository.createNewBrand();
      //   await _repository.createNewProduct();
      // //
      // }catch(e){
      // debugPrint(e.toString());
      // }

      emit(SplashEnd(isLoaded: true));
    });
  }
}


// class SplashCubit extends Cubit<SplashState> {
//   SplashCubit() : super(SplashInitial());
//   void startSplash(){
//     Future.delayed(const Duration(seconds: 2),(){
//       emit(SplashEnd());
//     });
//   }
// }



