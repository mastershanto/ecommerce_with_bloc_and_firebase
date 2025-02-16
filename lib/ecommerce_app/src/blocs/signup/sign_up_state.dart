part of 'sign_up_bloc.dart';



sealed class SignUpState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SignUpInitial extends SignUpState {
  final TextEditingController usernameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController ConfirmPasswordController=TextEditingController();
  @override
  // TODO: implement props
  List<Object?> get props => [usernameController,emailController,passwordController,ConfirmPasswordController];

}
final class SignUpLoadingState extends SignUpState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SignUpSuccessState extends SignUpState{}

final class SignUpFailedState extends SignUpState{
  final String message;
  SignUpFailedState(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
