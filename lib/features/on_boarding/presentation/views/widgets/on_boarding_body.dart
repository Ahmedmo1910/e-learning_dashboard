import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:teachers_dashboard/constants.dart';
import 'package:teachers_dashboard/core/services/shared_preferences_singleton.dart';
import 'package:teachers_dashboard/core/widgets/custom_text_button.dart';
import 'package:teachers_dashboard/features/auth/sign_in/presentation/views/signin_screen.dart';
import 'package:teachers_dashboard/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page?.round() ?? 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextButton(
                label: 'Skip',
                textColor: Colors.black,
                onPressed: () {
                  prefs.setBool(kIsOnBoardingViewSeen, true);
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(SigninScreen.routeName);
                },
              ),
            ],
          ),
          Expanded(child: OnBoardingPageView(pageController: pageController)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: currentPage > 0,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: CustomTextButton(
                  label: 'prev',
                  textColor: const Color(0xFFC4C4C4),
                  onPressed: () {
                    if (currentPage > 0) {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
              DotsIndicator(
                dotsCount: 3,
                position: currentPage.toDouble(),
                animate: true,
                decorator: DotsDecorator(
                  activeColor: Colors.black,
                  color: Colors.grey,
                  size: const Size.square(10.0),
                  activeSize: const Size(40.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              CustomTextButton(
                label: currentPage < 2 ? 'Next' : 'Get Started',
                onPressed: () {
                  if (currentPage < 2) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    prefs.setBool(kIsOnBoardingViewSeen, true);
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(SigninScreen.routeName);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
