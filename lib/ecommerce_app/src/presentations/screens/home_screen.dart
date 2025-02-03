import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/presentations/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/login/login_bloc.dart';
import '../../routs/route_pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
            context.read<LoginBloc>().add(RequestLogOutEvent());
            },
          ),
        ],
      ),
      body: Column(children: [
        ListTile(
          title: Text("Hello, Bloc"),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          subtitle: Text("Welcome to Laze"),
          subtitleTextStyle: Theme.of(context).textTheme.labelMedium,
        ),
        FullWidthButton(
          buttonText: "Go to Signup Screen",
          onTap: () {
            context.pushNamed(Routes.REGISTER_ROUTE);
          },
        ),
      ]),
    );
  }
}
