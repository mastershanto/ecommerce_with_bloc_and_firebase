import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/presentations/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../../../blocs/blocs.dart';
import '../../../routs/route_pages.dart';
import '../../widgets/full_width_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Let's get started",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          BlocConsumer<LoginBloc, LoginState>(
              builder: (context, state) {

                if(state is LoginLoading){
                  return Center(child:CircularProgressIndicator());
                }

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.facebook,
                        onPressed: () {
                          context.read<LoginBloc>().add(RequestFacebookLogin());
                        },
                      ),
                      Gap(20),
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.twitter,
                        onPressed: () {},
                      ),
                      Gap(20),
                      SocialLoginButton(
                        buttonType: SocialLoginButtonType.google,
                        onPressed: () {
                          context.read<LoginBloc>().add(RequestGoogleLogin());
                        },
                      ),
                    ],
                  ),
                );
              }, listener: (context, state) {

                Fluttertoast.showToast(msg: "Login Success");
                Future.delayed(Duration(seconds: 1 ), (){
                  context.goNamed(Routes.HOME_ROUTE);
                });

          }),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have and account?",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              FullWidthButton(
                buttonText: "Create an account",
                onTap: () => context.pushNamed(
                  Routes.REGISTER_ROUTE,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
