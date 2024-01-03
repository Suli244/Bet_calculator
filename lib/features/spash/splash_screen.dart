import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/core/premium/first_open.dart';
import 'package:bet_calculator/core/premium/premium.dart';
import 'package:bet_calculator/features/bottom_navigator/bottom_naviator_screen.dart';
import 'package:bet_calculator/features/on_boarding/on_boarding_screen.dart';
import 'package:bet_calculator/features/premium/premium_screen.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _tradeNotOpIqHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.logo,
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }

  _tradeNotOpIqHome() async {
    await Future.delayed(const Duration(milliseconds: 1450));
    final isFirst = await FirstOpenBetCalculator.getFirstOpen();
    final isPremium = await PremiumBetCalculator.getPremium();
    if (!isFirst) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      try {
        final InAppReview inAppReview = InAppReview.instance;

        if (await inAppReview.isAvailable()) {
          inAppReview.requestReview();
        }
      } catch (e) {
        throw Exception(e);
      }
    } else if (!isPremium) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PremiumScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigatorScreen(),
        ),
      );
    }
  }
}
