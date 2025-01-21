part of 'counter_bloc.dart';

@immutable
sealed class CounterState extends Equatable {
  final int counterValue;
  const CounterState(this.counterValue);
  @override
  // TODO: implement props
  List<Object?> get props => [counterValue];

  @override
  // TODO: implement props
  String toString() =>"CounterState(counterValue:$counterValue)";
}

final class CounterInitial extends CounterState {
  CounterInitial():super(0);
}
final class IncrementState extends CounterState {
  final int counterValue;
  IncrementState(this.counterValue):super(counterValue);
}
final class DecrementState extends CounterState {
  final int counterValue;
  DecrementState(this.counterValue):super(counterValue);
}
