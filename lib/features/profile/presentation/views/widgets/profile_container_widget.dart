import 'package:flutter/material.dart';
import 'custom_list_tile_widget.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/features/profile/presentation/views/subjects_screen.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Text(
                  "Username",
                  style: AppTextStyles.semiBold24.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "username@gmail.com",
                  style: AppTextStyles.medium18.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),

                const SizedBox(height: 35),

                CustomListTileWidget(
                  title: "Edit Profile",
                  leadingIcon: Icons.edit_outlined,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: "Subjects",
                  leadingIcon: Icons.menu_book_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, SubjectsScreen.routeName);
                  },
                ),
                CustomListTileWidget(
                  title: "Lessons",
                  leadingIcon: Icons.note,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: "Share App",
                  leadingIcon: Icons.share_outlined,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: "Privacy Policy",
                  leadingIcon: Icons.lock_outline,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: "Sign Out",
                  leadingIcon: Icons.logout,
                  isSignOut: true,
                  onTap: () {},
                ),
              ],
            ),
          ),

          Positioned(
            top: -50,
            child: CircleAvatar(
              radius: 55,
              child: Image.asset("assets/images/on_boarding1.png"),
            ),
          ),
        ],
      ),
    );
  }
}
