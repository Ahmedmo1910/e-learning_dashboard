import 'package:flutter/material.dart';
import 'package:teachers_dashboard/features/auth/forget_password/presentation/views/forget_password_screen.dart';
import 'package:teachers_dashboard/features/auth/sign_in/presentation/views/signin_screen.dart';
import 'package:teachers_dashboard/features/profile/presentation/views/lesson_screen.dart';
import 'package:teachers_dashboard/main_screen.dart';
import '../../features/exam/presentation/views/create_exams_screen.dart';
import '../../features/exam/presentation/views/view_exams_screen.dart';
import '../../features/lessons/presentation/view/view_lessons_screen.dart';
import '../../features/on_boarding/presentation/views/on_boarding_screen.dart';
import '../../features/profile/presentation/views/students_screen.dart';
import '../../features/profile/presentation/views/subjects_screen.dart';
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
    case CreateExamsScreen.routeName:
      return MaterialPageRoute(builder: (context) => const CreateExamsScreen());
    case ViewExamsScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ViewExamsScreen());
    case SubjectsScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SubjectsScreen());
    case LessonScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LessonScreen());
    case ViewLessonsScreen.routeName:
      return MaterialPageRoute(builder: (context) => const ViewLessonsScreen());
    case StudentsScreen.routeName:
      return MaterialPageRoute(builder: (context) => const StudentsScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
