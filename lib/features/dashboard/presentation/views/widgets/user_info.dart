import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:teachers_dashboard/core/services/localization_provider.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/core/widgets/language_selector.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(10),

        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.darkPrimaryColor,
          //backgroundImage: AssetImage('assets/images/MyPhoto.jpg'),
        ),

        Gap(15),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // 'Mr, User Name',
              S.of(context).userNameTitle,
              style: AppTextStyles.bold16.copyWith(color: Colors.white),
            ),
            Gap(5),
            Text(
              // 'Welcome to Your Dashboard',
              S.of(context).welcomeDashboard,
              style: AppTextStyles.regular14.copyWith(color: Colors.white70),
            ),
          ],
        ),
        Spacer(),

        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(60, 255, 252, 252),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded),
            iconSize: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
