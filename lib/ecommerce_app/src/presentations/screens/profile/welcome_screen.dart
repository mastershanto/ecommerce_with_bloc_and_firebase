
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../../blocs/blocs.dart';
import '../../../routs/route_pages.dart';
import '../../../utils/values.dart';
import '../../widgets/full_width_button.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme=Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Let's Get Started",
            style: _theme.textTheme.titleLarge,
          ),
          BlocConsumer<LoginBloc, LoginState>(
            builder: (context, state) {
              if(state is LoginLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SocialLoginButton(
                        buttonType: SocialLoginButtonType.facebook,
                        onPressed: () => context.read<LoginBloc>().add(RequestFacebookLogin())),
                    const Gap(10),
                    // SocialLoginButton(
                    //     buttonType: SocialLoginButtonType.twitter,
                    //     onPressed: () => context.read<LoginBloc>().add(RequestTwitterLogin())),
                    // const Gap(10),
                    SocialLoginButton(
                        buttonType: SocialLoginButtonType.google, onPressed: () => context.read<LoginBloc>().add(RequestGoogleLogin())),
                  ],
                ),
              );
            },
            listener: (context, state) {
              if(state is LoginSuccess){
                Fluttertoast.showToast(msg: 'Login Success');
                Future.delayed(const Duration(milliseconds: 500), (){
                  context.goNamed(Routes.HOME_ROUTE);
                });
              }
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: _theme.textTheme.bodyMedium?.copyWith(
                        color: _theme.colorScheme.onSurface),
                  ),
                  TextButton(
                    onPressed: () => context.pushNamed(Routes.LOGIN_ROUTE),
                    child: Text(
                      Values.SIGN_IN_BUTTON_TEXT,
                      style: _theme.textTheme.labelLarge?.copyWith(
                          color: _theme
                              .colorScheme
                              .onPrimaryContainer),
                    ),)
                ],
              ),
              FullWidthButton(
                buttonText: Values.CREATE_ACCOUNT_TEXT,
                onTap: () => context.pushNamed(Routes.REGISTER_ROUTE),
              )
            ],
          )
        ],
      ),
    );
  }
}
