import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class StudentsCardItem extends StatelessWidget {
  final String fullName, userId, email, phone;
  const StudentsCardItem({
    super.key,
    required this.fullName,
    required this.userId,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 40,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fullName, style: AppTextStyles.semiBold16),
                    const Gap(4.0),
                    Text(
                      email,
                      style: AppTextStyles.medium14.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                    const Gap(4.0),
                    Text(
                      phone,
                      style: AppTextStyles.medium14.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  userId,
                  style: AppTextStyles.medium12,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.copy,size: 20,),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: userId));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(S.of(context).copied),
                        duration: Duration(milliseconds: 800),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
