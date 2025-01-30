part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class RequestGoogleLogin extends LoginEvent{}
// class LoginLoading extends LoginEvent{}
// class LoginLoading extends LoginEvent{}
