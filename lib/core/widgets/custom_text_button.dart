import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';


class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color textColor;

  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        textStyle: AppTextStyles.semiBold18.copyWith(
          color: textColor,
        ),
      ),
      child: Text(label),
    );
  }
}
