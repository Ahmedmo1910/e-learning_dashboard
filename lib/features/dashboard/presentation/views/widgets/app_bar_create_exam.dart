import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';

class appBarInCreateExam extends StatelessWidget {
  const appBarInCreateExam({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        const SizedBox(width: 30),

        Text(
          "Create New exam ",
          style: TextStyle(
            color: AppColors.darkPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        TextButton(
          onPressed: () {},
          child: const Text(
            'Save',
            style: TextStyle(
              color: AppColors.handleColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
