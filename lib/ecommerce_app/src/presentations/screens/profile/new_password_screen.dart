import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../routs/route_pages.dart';
import '../../widgets/full_width_button.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
                    "Welcome ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    "Please enter data to continue",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          // controller: state.emailController,
                          validator: (value){
                            if(value==""||value==null){
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
                          validator: (value){
                            if(value==""||value==null){
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
                      Switch(value:true,
                          onChanged:(value){}),
                      // BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                      //   builder: (context, state) {
                      //     return Switch(
                      //         value:
                      //         state is SwitchChanged ? state.value : true,
                      //         onChanged: (value) => context
                      //             .read<RememberSwitchCubit>()
                      //             .switchToggle(value));
                      //   },
                      // ),
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
                buttonText: "Login",
                onTap: (){
                  if(formKey.currentState!.validate()){
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
