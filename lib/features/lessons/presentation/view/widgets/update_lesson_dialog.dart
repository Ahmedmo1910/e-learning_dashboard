import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/lessons/presentation/cubit/lessons_cubit.dart';

class UpdateLessonDialog extends StatefulWidget {
  final Map<String, dynamic> item;
  final String teacherSubjectId;

  const UpdateLessonDialog({
    super.key,
    required this.item,
    required this.teacherSubjectId,
  });

  @override
  State<UpdateLessonDialog> createState() => _UpdateLessonDialogState();
}

class _UpdateLessonDialogState extends State<UpdateLessonDialog> {
  late final TextEditingController titleController;
  late final TextEditingController descController;
  late final TextEditingController sortController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.item['lessontitle']);
    descController = TextEditingController(
      text: widget.item['lessondescription'],
    );
    sortController = TextEditingController(
      text: widget.item['sort'].toString(),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    sortController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      title: Text(
        'Update Lesson',
        style: AppTextStyles.medium20.copyWith(color: AppColors.primaryColor),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: titleController,
            labelText: 'Title',
            hintText: 'Enter Lesson Title',
          ),
          Gap(8),
          CustomTextFormField(
            controller: descController,
            labelText: 'Description',
            hintText: 'Enter Lesson Description',
          ),
          Gap(8),
          CustomTextFormField(
            controller: sortController,
            labelText: 'Sort',
            hintText: 'Enter Lesson Sort Order',
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: AppTextStyles.medium16.copyWith(color: AppColors.primaryColor),
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<LessonsCubit>().updateLesson(
              id: widget.item['id'].toString(),
              teacherSubjectId: widget.teacherSubjectId,
              lessonTitle: titleController.text.trim(),
              lessonDescription: descController.text.trim(),
              sort: int.parse(sortController.text.trim()),
            );
            Navigator.of(context).pop();
          },
          child: Text(
            'Save',
            style: AppTextStyles.medium16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
