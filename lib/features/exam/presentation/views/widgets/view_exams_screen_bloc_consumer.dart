import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:teachers_dashboard/core/widgets/snack_bar_helper.dart';
import 'package:teachers_dashboard/features/exam/presentation/cubit/exam_cubit.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_state.dart';

import 'view_exams_screen_body.dart';

class ViewExamsScreenBlocConsumer extends StatelessWidget {
  const ViewExamsScreenBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamCubit, ExamState>(
      listener: (context, state) {
        if (state is ExamDeleted) {
          SnackBarHelper.showSnackBar(
            context,
            'Exam Deleted Successfully',
            Colors.green,
          );
        } else if (state is ExamUpdated) {
          SnackBarHelper.showSnackBar(
            context,
            'Lesson Updated Successfully',
            Colors.green,
          );
        } else if (state is ExamFailure) {
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
          child: ViewExamsScreenBody(),
        );
      },
    );
  }
}
