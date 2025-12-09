import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onTap,
    this.isSignOut = false,
  });

  final String title;
  final IconData leadingIcon;
  final VoidCallback? onTap;

  final bool isSignOut;

  @override
  Widget build(BuildContext context) {
    final textColor = isSignOut
        ? const Color(0xffE74C3C)
        : AppColors.primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
      child: ListTile(
        // contentPadding: EdgeInsets.zero,
        leading: Icon(leadingIcon, color: textColor, size: 24),
        title: Text(
          title,
          style: AppTextStyles.semiBold16.copyWith(color: textColor),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: textColor,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}
