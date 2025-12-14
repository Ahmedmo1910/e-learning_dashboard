import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:teachers_dashboard/features/exam/presentation/cubit/exam_cubit.dart';

class UpdateExamDialog extends StatefulWidget {
  final Map<String, dynamic> item;

  const UpdateExamDialog({super.key, required this.item});

  @override
  State<UpdateExamDialog> createState() => _UpdateExamDialogState();
}

class _UpdateExamDialogState extends State<UpdateExamDialog> {
  late final TextEditingController titleController;
  late final TextEditingController descController;
  late final TextEditingController urlController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.item['attachmenttitle'],
    );
    descController = TextEditingController(
      text: widget.item['attachmentdescription'],
    );
    urlController = TextEditingController(text: widget.item['attachmenturl']);
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        'Update Exam',
        style: AppTextStyles.medium20.copyWith(color: AppColors.primaryColor),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: titleController,
            labelText: 'Title',
            hintText: 'Enter Exam Title',
          ),
          Gap(8),
          CustomTextFormField(
            controller: descController,
            labelText: 'Description',
            hintText: 'Enter Exam Description',
          ),
          Gap(8),
          CustomTextFormField(
            controller: urlController,
            labelText: 'URL',
            hintText: 'Enter Attachment URL',
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: AppTextStyles.medium16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            context.read<ExamCubit>().updateAttachment(
              id: widget.item['id'].toString(),
              attachmentTitle: titleController.text.trim(),
              attachmentDescription: descController.text.trim(),
              attachmentUrl: urlController.text.trim(),
            );
            Navigator.pop(context);
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
