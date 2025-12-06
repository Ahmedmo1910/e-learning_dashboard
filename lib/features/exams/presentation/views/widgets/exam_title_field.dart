import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';

class ExamTitleField extends StatelessWidget {
  final TextEditingController controller;

  const ExamTitleField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: "Exam Title",
    );
  }
}