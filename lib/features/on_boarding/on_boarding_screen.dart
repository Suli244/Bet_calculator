import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/features/on_boarding/widget/page_view_item.dart';
import 'package:bet_calculator/features/premium/premium_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          PageViewItem(
            title: 'Highlights',
            titleTwo: 'Watch the best sports\nmoments',
            image: AppImages.pageViewOne,
            controller: controller,
            onPressNext: () {
              controller.jumpToPage(1);
            },
            onPressTermOfService: () {},
            onPressRestore: () {},
            onPressPrivacyPolicy: () {},
          ),
          PageViewItem(
            title: 'Bet calculator',
            titleTwo: 'Calculate your possible\nwinnings',
            image: AppImages.pageViewTwo,
            controller: controller,
            onPressNext: () {
              controller.jumpToPage(2);
            },
            onPressTermOfService: () {},
            onPressRestore: () {},
            onPressPrivacyPolicy: () {},
          ),
          PageViewItem(
            title: 'Strategies',
            titleTwo: 'Maximize your chances\nto success',
            image: AppImages.pageViewTrhee,
            controller: controller,
            onPressNext: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const PremiumScreen(),
                ),
                (route) => false,
              );
            },
            onPressTermOfService: () {},
            onPressRestore: () {},
            onPressPrivacyPolicy: () {},
          ),
        ],
      ),
    );
  }
}
