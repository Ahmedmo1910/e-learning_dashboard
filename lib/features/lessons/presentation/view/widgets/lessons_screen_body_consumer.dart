import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:teachers_dashboard/core/widgets/snack_bar_helper.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_cubit.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_state.dart';
import 'package:teachers_dashboard/features/lessons/presentation/view/widgets/lessons_screen_body.dart';

class LessonsScreenBodyConsumer extends StatelessWidget {
  const LessonsScreenBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonsCubit, LessonsState>(
      listener: (context, state) {
        if (state is LessonCreated) {
          SnackBarHelper.showSnackBar(
            context,
            'Lesson Created Suss',
            Colors.green,
          );
        } else if (state is LessonsFailure) {
          SnackBarHelper.showSnackBar(
            context,
            'Field to create lesson',
            Colors.red,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is LessonsLoading ? true : false,
          child: LessonsScreenBody(),
        );
      },
    );
  }
}
