import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/utils/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../blocs/blocs.dart';
import '../../../routs/route_pages.dart';
import '../../../utils/values.dart';
import '../../widgets/full_width_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  BlocConsumer<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      if (state is SignUpInitial) {
                        return Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: state.usernameController,
                                validator: (value) =>
                                    FormValidator.inputValidator(value),
                                decoration: InputDecoration(
                                  label: const Text("User Name"),
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outlineVariant),
                                ),
                              ),
                              TextFormField(
                                controller: state.emailController,
                                validator: (value) =>
                                    FormValidator.emailValidator(value),
                                decoration: InputDecoration(
                                  label: const Text("Email Address"),
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outlineVariant),
                                ),
                              ),
                              TextFormField(
                                controller: state.passwordController,
                                validator: (value) =>
                                    FormValidator.inputValidator(value),
                                decoration: InputDecoration(
                                  label: const Text("Password"),
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outlineVariant),
                                ),
                              ),
                              TextFormField(
                                controller: state.ConfirmPasswordController,
                                validator: (value) =>
                                    FormValidator.inputValidator(value),
                                decoration: InputDecoration(
                                  label: const Text("Confirm Password"),
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outlineVariant),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                    listener: (context,state) {
                      if(state is SignUpSuccessState){
                        context.goNamed(Routes.HOME_ROUTE);
                      }
                      if(state is SignUpFailedState){
                        Fluttertoast.showToast(msg: state.message);
                      }
                    },
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Remember Me", style: _theme.textTheme.labelMedium),
                      BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                        builder: (context, state) {
                          if (state is SwitchChanged) {}
                          return Switch(
                              value:
                                  state is SwitchChanged ? state.value : true,
                              onChanged: (value) {
                                context
                                    .read<RememberSwitchCubit>()
                                    .SwitchToggle(value);
                              });
                        },
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  return FullWidthButton(
                    buttonText: Values.SIGN_UP_BUTTON_TEXT,
                    buttonChild: state is SignUpLoadingState
                        ? LoadingAnimationWidget.discreteCircle(
                            color: Colors.green, size: 16)
                        : null,
                    onTap: () {
                      if (state is SignUpInitial) {
                        context.read<SignUpBloc>().add(RequestEmailSignUpEvent(
                            state.usernameController.text,
                            state.emailController.text,
                            state.passwordController.text,
                            state.passwordController.text));
                      }

                      if (formKey.currentState!.validate()) {
                        context.pushNamed(Routes.LOGIN_ROUTE);
                      }
                    },
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
