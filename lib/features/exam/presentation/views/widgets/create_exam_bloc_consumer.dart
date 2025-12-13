import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:teachers_dashboard/core/widgets/snack_bar_helper.dart';
import 'package:teachers_dashboard/features/exam/presentation/cubit/exam_cubit.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
import 'create_exams_screen_body.dart';

class CreateExamBlocConsumer extends StatelessWidget {
  const CreateExamBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamCubit, ExamState>(
      listener: (context, state) {
        if (state is ExamCreated) {
          SnackBarHelper.showSnackBar(
            context,
            S.of(context).examCreatedSuccess,
            Colors.green,
          );
        } else if (state is ExamFailure) {
          SnackBarHelper.showSnackBar(
            context,
            S.of(context).examCreateFailed,
            Colors.red,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ExamLoading ? true : false,
          child: CreateExamsScreenBody(),
        );
      },
    );
  }
}
