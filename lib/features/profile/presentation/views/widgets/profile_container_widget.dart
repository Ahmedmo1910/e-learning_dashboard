import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/widgets/language_selector.dart';
import 'package:teachers_dashboard/features/profile/presentation/views/lesson_screen.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:teachers_dashboard/features/profile/presentation/views/lesson_screen.dart';
import '../../cubits/profile_cubit/profile_cubit.dart';
import 'custom_list_tile_widget.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/features/profile/presentation/views/subjects_screen.dart';

class ProfileContainerWidget extends StatelessWidget {
  const ProfileContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(
            child: Lottie.asset(
              'assets/animations/loading.json',
              width: 250,
              height: 250,
            ),
          );
        }

        if (state is ProfileLoaded) {
          final profile = state.profile;

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
                Text(
                  S.of(context).username,

                  style: AppTextStyles.semiBold24.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  S.of(context).email,

                  style: AppTextStyles.medium18.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),

                const SizedBox(height: 35),

                CustomListTileWidget(
                  title: S.of(context).editProfile,
                  leadingIcon: Icons.edit_outlined,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: S.of(context).subjects,
                  leadingIcon: Icons.menu_book_outlined,
                  onTap: () {
                    Navigator.pushNamed(context, SubjectsScreen.routeName);
                  },
                ),
                CustomListTileWidget(
                  title: S.of(context).lessons,
                  leadingIcon: Icons.note,
                  onTap: () {
                    Navigator.pushNamed(context, LessonScreen.routeName);
                  },
                ),
                CustomListTileWidget(
                  title: S.of(context).shareApp,
                  leadingIcon: Icons.share_outlined,
                  onTap: () {},
                ),
                CustomListTileWidget(
                  title: S.of(context).privacyPolicy,
                  leadingIcon: Icons.lock_outline,
                  onTap: () {},
                ),
                LanguageSelectorTile(),
                CustomListTileWidget(
                  title: S.of(context).signOut,
                  leadingIcon: Icons.logout,
                  isSignOut: true,
                  onTap: () {},
                ),
              ],
            ),
          );
        }

        if (state is ProfileFailure) {
          return Center(child: Text(state.errorMsg));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
