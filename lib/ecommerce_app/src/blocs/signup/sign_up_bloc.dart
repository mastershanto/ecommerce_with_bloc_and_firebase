import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/repository/repository.dart';

part 'sign_up_event.dart';

part "sign_up_state.dart";

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository repository;

  SignUpBloc(this.repository) : super(SignUpInitial()) {
    on<RequestEmailSignUpEvent>((event, emit) async {
      emit(SignUpLoadingState());

      try {
        final user = await repository.signUpWithEmail(
            event.email, event.password, event.userName);

        if (user!=null) {
          emit(SignUpSuccessState());
        }else{
          emit(SignUpFailedState('Failed to sign up'));
          return null;
        }
      } catch (e) {
        emit(SignUpFailedState(e.toString()));
      }
    });
  }
}
