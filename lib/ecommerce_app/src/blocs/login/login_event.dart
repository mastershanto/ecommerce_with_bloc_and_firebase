part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class RequestGoogleLoginEvent extends LoginEvent{}
class RequestFacebookLoginEvent extends LoginEvent{}
class RequestTwitterLoginEvent extends LoginEvent{}
class RequestEmailLoginEvent extends LoginEvent{}
class RequestLogOutEvent extends LoginEvent{}
