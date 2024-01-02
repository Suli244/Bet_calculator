import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/features/bottom_navigator/bottom_naviator_screen.dart';
import 'package:bet_calculator/features/on_boarding/widget/page_view_item.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageViewItem(
        onTapX: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigatorScreen(),
            ),
            (route) => false,
          );
        },
        isSmoothPageIndicator: false,
        isX: true,
        title: 'Strategies',
        titleTwo: 'Get access to all features\n with Premium Version',
        titleNext: 'Buy Premium for \$0,99',
        image: AppImages.premium,
        onPressNext: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavigatorScreen(),
            ),
            (route) => false,
          );
        },
        textStyleNext: AppTextStyles.s20W600(color: Colors.white),
      ),
    );
  }
}
