import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';

class UrlExamField extends StatelessWidget {
  final TextEditingController controller;

  const UrlExamField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: "Exam Url",
      keyboardType: TextInputType.url,
    );
  }
}