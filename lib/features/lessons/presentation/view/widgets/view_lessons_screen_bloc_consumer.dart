import 'package:flutter/material.dart';
import 'view_lessons_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:teachers_dashboard/core/widgets/snack_bar_helper.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_cubit.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_state.dart';

class ViewLessonsScreenBlocConsumer extends StatelessWidget {
  const ViewLessonsScreenBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonsCubit, LessonsState>(
      listener: (context, state) {
        if (state is LessonDeleted) {
          SnackBarHelper.showSnackBar(
            context,
            'Lesson Deleted Successfully',
            Colors.green,
          );
        } else if (state is LessonUpdated) {
          SnackBarHelper.showSnackBar(
            context,
            'Lesson Updated Successfully',
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
          child: ViewLessonsScreenBody(),
        );
      },
    );
  }
}
