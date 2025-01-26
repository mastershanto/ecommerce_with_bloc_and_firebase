import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/blocs.dart';
import '../../../blocs/remember_switch/remember_switch_cubit.dart';
import '../../../routs/route_pages.dart';
import '../../widgets/full_width_button.dart';
import '../../widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          // controller:state.userNameController,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "User name is required";
                            }
                            return null;
                          },
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
                          // controller: state.emailController,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Email address is required";
                            }
                            return null;
                          },
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
                          // controller: state.passwordController,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Password is required";
                            }
                            return null;
                          },
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
                      ],
                    ),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Remember Me",
                          style: Theme.of(context).textTheme.labelMedium),
                      BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                        builder: (context, state) {
                          if (state is SwitchChanged) {}
                          return Switch(
                              value: state is SwitchChanged ? state.value : true,
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
              FullWidthButton(
                buttonText: "Sign Up",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.pushNamed(Routes.LOGIN_ROUTE);
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
