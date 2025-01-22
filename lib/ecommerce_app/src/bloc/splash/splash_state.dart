part of 'splash_cubit.dart';

@immutable
sealed class SplashState extends Equatable {
  final bool isLoaded;
  SplashState(this.isLoaded);
  @override
  // TODO: implement props
  List<Object?> get props => [isLoaded];
}

final class SplashInitial extends SplashState {
  final bool isLoaded;
  SplashInitial({required this.isLoaded}):super(false);
}
final class SplashEnd extends SplashState{
  final bool isLoaded;
  SplashEnd({required this.isLoaded}):super(false);
}