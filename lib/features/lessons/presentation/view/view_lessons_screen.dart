import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/view_lessons_screen_bloc_consumer.dart';
import 'package:teachers_dashboard/core/widgets/custom_app_bar.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_cubit.dart';

class ViewLessonsScreen extends StatelessWidget {
  const ViewLessonsScreen({super.key});
  static const String routeName = 'viewLessonsScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonsCubit(),
      child: Scaffold(
        appBar: customAppBar(context, title: 'All Lessons'),
        body: ViewLessonsScreenBlocConsumer(),
      ),
    );
  }
}
