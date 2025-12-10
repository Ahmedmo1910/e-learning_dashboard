import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';

// ignore: camel_case_types
class appBarInCreateExam extends StatelessWidget {
  const appBarInCreateExam({
    super.key,
    required this.screenName,
    this.onPressed,
  });
  final String screenName;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(icon: const Icon(Icons.arrow_back), onPressed: onPressed),

        const SizedBox(width: 50),

        Text(
          screenName,
          style: TextStyle(
            color: AppColors.darkPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        /*TextButton(
          onPressed: () {},
          child: const Text(
            'Save',
            style: TextStyle(
              color: AppColors.handleColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),*/
      ],
    );
  }
}
