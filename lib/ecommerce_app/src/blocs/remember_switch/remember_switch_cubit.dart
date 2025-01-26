import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'remember_switch_state.dart';

class RememberSwitchCubit extends Cubit<RememberSwitchState> {
  RememberSwitchCubit() : super(RememberSwitchInitial());

  void SwitchToggle(value){
emit(SwitchChanged(value));
  }
}
  

