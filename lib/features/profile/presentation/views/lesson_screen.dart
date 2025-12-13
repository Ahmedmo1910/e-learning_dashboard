import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/profile/presentation/cubits/lesson_cubit/lesson_cubit.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
import 'widgets/lesson_screen_body.dart';
import 'package:teachers_dashboard/core/widgets/custom_app_bar.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});
  static const String routeName = 'lessonScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonCubit(),
      child: Scaffold(
        appBar: customAppBar(context,  title: S.of(context).allLessons,),
        body: LessonScreenBody(),
      ),
    );
  }
}
