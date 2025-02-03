import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../data/repository/repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<RequestGoogleLoginEvent>((event, emit) async {
  try{
    emit(LoginLoadingState());
    final user=await repository.signInWithGoogle();
  if(user!=null){
    debugPrint("User: ${user.displayName}");
    emit(LoginSuccessState());
  }else{
    debugPrint("User: Failed to found user information!");
    emit(LoginFailedState("User is null after login!"));
    return null;
  }



  } catch(error){
    debugPrint(error.toString());
    emit(LoginFailedState(error.toString()));
  }
    });
    on<RequestFacebookLoginEvent>((event, emit) async {
  try{
    emit(LoginLoadingState());
    final user=await repository.signInWithFacebook();

    debugPrint("User: ${user?.displayName}");
    emit(LoginSuccessState());

  } catch(error){
    debugPrint(error.toString());
    emit(LoginFailedState(error.toString()));
  }
    });

    // on<RequestTwitterLogin>((event, emit) async{
    //   try{
    //     emit(LoginLoading());
    //     final user=await repository.signInWithTwitter();
    //     debugPrint("User: ${user?.displayName}");
    //     emit(LoginSuccess());
    //
    //   }catch(error){
    //     debugPrint(error.toString());
    //     emit(LoginFailed(error.toString()));
    //   }
    //
    // });


    on<RequestEmailLoginEvent>((event, emit)async{

    });
    on<RequestLogOutEvent>((event, emit) async{
      try {
        await repository.signOutUser().then((value) =>emit(LogOutSuccessState()));
      }catch(e){
        emit(LoginFailedState(e.toString()));
      }
    });
  }



}
