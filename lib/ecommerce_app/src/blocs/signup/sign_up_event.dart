part of 'sign_up_bloc.dart';


sealed class SignUpEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RequestEmailSignUpEvent extends SignUpEvent {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  RequestEmailSignUpEvent(
    this.userName,
    this.email,
    this.password,
    this.confirmPassword,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [userName, email, password, confirmPassword];
}
