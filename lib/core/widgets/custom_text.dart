import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';

class CustomText extends StatelessWidget {
  final String label;
  final Color textColor;

  const CustomText({
    super.key,
    required this.label,
    this.textColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: AppTextStyles.semiBold36.copyWith(color: textColor),
    );
  }
}
