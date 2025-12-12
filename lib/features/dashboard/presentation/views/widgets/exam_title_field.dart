import 'package:flutter/material.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class ExamTitleField extends StatelessWidget {
  const ExamTitleField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "Exam Title",
        hintText: "e.g., Mid-Term Biology Exam",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
