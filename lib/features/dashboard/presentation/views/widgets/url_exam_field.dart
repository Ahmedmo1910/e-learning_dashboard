import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';

// ignore: camel_case_types
class Url_Exam_Field extends StatelessWidget {
  const Url_Exam_Field({
    super.key,
    required TextEditingController durationController,
  }) : _durationController = durationController;

  final TextEditingController _durationController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _durationController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Exam Link',
        hintText: 'https://examlink.com/',
        hintStyle: TextStyle(color: AppColors.greyColor),
        border: OutlineInputBorder(),
      ),
    );
  }
}
