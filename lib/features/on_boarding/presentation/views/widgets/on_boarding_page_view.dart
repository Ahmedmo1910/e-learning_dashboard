import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: PageView(
        controller: pageController,
        children: [
          //   image: 'assets/images/on_boarding3.png',
          //   subtitle:
          //       'Start your learning adventure today — your future self will thank you!',
          //   title: Text(
          //     'Dive into Your First\n             Lesson!',
          //     style: AppTextStyles.semiBold36.copyWith(
          //       color: AppColors.primaryColor,
          //     ),
          //   ),
          // ),
          PageViewItem(
            image: 'assets/images/on_boarding1.png',
            subtitle: S.of(context).onBoardingSubtitle1,
            title: Text(
              S.of(context).onBoardingTitle1,
              style: AppTextStyles.semiBold36.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          PageViewItem(
            image: 'assets/images/on_boarding2.png',
            subtitle: S.of(context).onBoardingSubtitle2,
            title: Text(
              S.of(context).onBoardingTitle2,
              style: AppTextStyles.semiBold36.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          PageViewItem(
            image: 'assets/images/on_boarding3.png',
            subtitle: S.of(context).onBoardingSubtitle3,
            title: Text(
              S.of(context).onBoardingTitle3,
              style: AppTextStyles.semiBold36.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
