import 'package:ecommerce_with_bloc_and_firebase/ecommerce_app/src/data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/blocs/blocs.dart';
import 'src/blocs/login/login_bloc.dart';
import 'src/routs/route_pages.dart';
import 'theme/theme.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: _repositoryProviders(),
      child: MultiBlocProvider(
        providers: _blocProviders(),
        child: _buildApp(),
      ),
    );
  }

  //List of repository providers
  List<RepositoryProvider> _repositoryProviders() {
    return [
      RepositoryProvider<AuthRepository>(create: (context) => AuthRepository()),
    ];
  }

  //List of blocs providers
  List<BlocProvider> _blocProviders() {
    return [
      BlocProvider<SplashCubit>(create: (context) => SplashCubit()..startSplash()),
      BlocProvider<RememberSwitchCubit>(create: (context)=>RememberSwitchCubit()),
      BlocProvider<LoginBloc>(create:(context)=>LoginBloc(context.read<AuthRepository>())),
      BlocProvider<SignupBloc>(create:(context)=>SignupBloc()),
    ];
  }

  // Main App
  Widget _buildApp() {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          theme: const MaterialTheme(TextTheme()).light(),
          darkTheme: const MaterialTheme(TextTheme()).dark(),
          debugShowCheckedModeBanner: false,
          routerConfig: RoutePages.ROUTER,
        );
      },
    );
  }
}
