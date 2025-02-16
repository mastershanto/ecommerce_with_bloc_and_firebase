import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../routs/route_pages.dart';
import '../../../utils/asset_manager.dart';
import '../../widgets/full_width_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                    "Forgot Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AssetManager.CLOUD_LOCK,
                          height: 200,
                          width: 300,
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
                      ],
                    ),
                  ),
                  const Gap(20),
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
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 20,
                ),
                child: Text(
                  "To write your email to received "
                  "a confirmation code to set a new password",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              FullWidthButton(
                buttonText: "Confirm Mail",
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
