import 'package:flutter/material.dart';
import 'package:teachers_dashboard/features/auth/forget_password/presentation/views/forget_password_screen.dart';
import 'package:teachers_dashboard/features/auth/sign_in/presentation/views/signin_screen.dart';
import 'package:teachers_dashboard/main_screen.dart';
import '../../features/on_boarding/presentation/views/on_boarding_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case SigninScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SigninScreen());
    case ForgetPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordScreen(),
      );
    case MainScreen.routeName:
      return MaterialPageRoute(builder: (context) => const MainScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
