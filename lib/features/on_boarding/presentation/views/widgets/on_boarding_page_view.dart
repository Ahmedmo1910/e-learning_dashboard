import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
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
          PageViewItem(
            image: 'assets/images/on_boarding1.png',
            subtitle:
                'Every great journey begins with curiosity,\nLet’s unlock the power of your mind together.',
            title: Text(
              'Empower Your\n Mind with Us',

              style: AppTextStyles.semiBold36.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          PageViewItem(
            image: 'assets/images/on_boarding2.png',
            subtitle:
                'You already have what it takes — we’ll help you bring it to life.',
            title: Text(
              'Unlock Your Learning\n               Potential',
              style: AppTextStyles.semiBold36.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          PageViewItem(
            image: 'assets/images/on_boarding3.png',
            subtitle:
                'Start your learning adventure today — your future self will thank you!',
            title: Text(
              'Dive into Your First\n             Lesson!',
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
