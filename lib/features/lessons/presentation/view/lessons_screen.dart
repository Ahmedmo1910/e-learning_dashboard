import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_cubit.dart';
import 'package:teachers_dashboard/features/lessons/presentation/data/lessons_repo.dart';
import 'package:teachers_dashboard/features/lessons/presentation/view/widgets/lessons_screen_body.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonsCubit(LessonsRepo()),
      child: LessonsScreenBody(),
    );
  }
}
