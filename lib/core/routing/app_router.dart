import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/routing/routes.dart';
import 'package:hungry_app/features/login/manager/login_cubit.dart';
import 'package:hungry_app/features/login/presentation/screens/login_screen.dart';
import 'package:hungry_app/features/sign_up/manager/sign_up_cubit.dart';
import '../../features/sign_up/presentation/screens/sign_up_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      /// Login Screen
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      /// Sign Up Screen
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignUpCubit>(
            create: (context) => getIt<SignUpCubit>(),
            child: SignUpScreen(),
          ),
        );

      /// Default Case
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No Page Found For This ${settings.name}"),
            ),
          ),
        );
    }
  }
}
