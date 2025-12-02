import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
    required this.headerTitle,
    required this.headerSubTitle,
  });
  final String headerTitle;
  final String headerSubTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerTitle,
          style: AppTextStyles.bold24.copyWith(color: AppColors.primaryColor),
        ),
        SizedBox(height: 10),
        Text(
          headerSubTitle,
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
