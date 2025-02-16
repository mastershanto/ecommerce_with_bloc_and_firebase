import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../routs/route_pages.dart';
import '../../widgets/full_width_button.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme=Theme.of(context);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "New Password",
            style: _theme.textTheme.titleLarge,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          // controller: state.passwordController,
                          validator: (value) {
                            if (value == "" || value == null) {
                              return "Password is required";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text("New Password"),
                            labelStyle: _theme
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: _theme
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
                            label: const Text("Confirm Password"),
                            labelStyle: _theme
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: _theme
                                        .colorScheme
                                        .outlineVariant),
                          ),
                        ),
                      ],
                    ),
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
              Text("Please, write enter the new password", textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge,),
              FullWidthButton(
                buttonText: "Reset Password",
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
