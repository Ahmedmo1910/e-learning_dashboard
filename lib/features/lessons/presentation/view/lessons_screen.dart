import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_app_bar.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_cubit.dart';
import 'widgets/lessons_screen_body_consumer.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonsCubit(),
      child: Scaffold(
        appBar: customAppBar(context, title: 'Create New Lesson'),
        body: LessonsScreenBodyConsumer(),
      ),
    );
  }
}
