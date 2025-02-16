

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/repository/repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  AuthRepository repository;
  SignUpBloc(this.repository) : super(SignUpInitial()) {


    on<RequestEmailSignUpEvent>((event, emit) async {
      emit(SignUpLoadingState());
      try {
        await repository.signUpWithEmail(event.email, event.password, event.username);
        emit(SignUpSuccessState());
      } catch (e) {
        emit(SignUpFailedState(e.toString()));
      }

    });


  }
}
