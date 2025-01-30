import 'package:bloc/bloc.dart';
import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/blocs/Authentications/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<RequestGoogleLogin>((event, emit) {

    });
  }
}
