import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:teachers_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:teachers_dashboard/core/services/custom_bloc_observer.dart';
import 'package:teachers_dashboard/core/services/get_it_service.dart';
import 'package:teachers_dashboard/core/services/localization_provider.dart';
import 'package:teachers_dashboard/core/services/shared_preferences_singleton.dart';
import 'package:teachers_dashboard/features/splash/presentation/views/splash_screen.dart';
import 'package:teachers_dashboard/features/teachers/views/grades_screen.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await prefs.init();

  setupGetIt();
  runApp(
    ChangeNotifierProvider(
      create: (_) => getIt<LocalizationProvider>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final localization = context.watch<LocalizationProvider>();

    return MaterialApp(
      locale: localization.locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      title: 'Teachers Dashboard',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      // initialRoute: SplashScreen.routeName,
      home : AddStudentGradeScreen(),
    );
  }
}
