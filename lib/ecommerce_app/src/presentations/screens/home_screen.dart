import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/presentations/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/login/login_bloc.dart';
import '../../routs/route_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LogOutSuccess) {
                context.pushNamed(Routes.WELCOME_ROUTE);
              }
            },
            child: IconButton(
              icon: Icon(
                Icons.logout_rounded,
                color: _theme.colorScheme.primary,
              ),
              onPressed: () {
                context.read<LoginBloc>().add(RequestSignOut());
              },
            ),
          ),
        ],
      ),
      body: Column(children: [
        ListTile(
          title: Text("Hello, Bloc"),
          titleTextStyle: _theme.textTheme.titleLarge,
          subtitle: Text("Welcome to Laze"),
          subtitleTextStyle: _theme.textTheme.labelMedium,
        ),
        FullWidthButton(
          buttonText: "Go to Signup Screen",
          onTap: () {
            context.pushNamed(Routes.REGISTER_ROUTE);
          },
        ),
        const Gap(20),
        // const customSearchBar();
        const Gap(20),
        SizedBox(
          child: ListView.separated(
              itemBuilder: (context, index)=>Container(),
              separatorBuilder:(context,index) =>Divider(),
              itemCount: 100),
        ),
      ]),
    );
  }
}
