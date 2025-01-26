part of 'remember_switch_cubit.dart';

@immutable
sealed class RememberSwitchState{}

final class RememberSwitchInitial extends RememberSwitchState {}
final class SwitchChanged extends RememberSwitchState {
  final bool value;
  SwitchChanged(this.value);
}
