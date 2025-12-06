import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_form_field.dart';

class InstructionsField extends StatelessWidget {
  final TextEditingController controller;

  const InstructionsField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: "Instructions",
      keyboardType: TextInputType.multiline,
    );
  }
}