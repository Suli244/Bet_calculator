import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/core/premium/first_open.dart';
import 'package:bet_calculator/core/premium/premium.dart';
import 'package:bet_calculator/core/urls.dart';
import 'package:bet_calculator/features/bottom_navigator/bottom_naviator_screen.dart';
import 'package:bet_calculator/features/on_boarding/widget/page_view_item_bet_calculator.dart';
import 'package:bet_calculator/features/premium/premium_screen.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/custom_button.dart';
import 'package:bet_calculator/widgets/restore_widgets.dart';
import 'package:bet_calculator/widgets/web_view_bet_calculator.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const ClampingScrollPhysics(),
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                currantPage = value;
              });
            },
            children: const [
              PageViewItemBetCalculator(
                image: AppImages.pageViewOne,
                title: 'Highlights',
                subTitle: 'Watch the best sports\nmoments',
              ),
              PageViewItemBetCalculator(
                image: AppImages.pageViewTwo,
                title: 'Bet calculator',
                subTitle: 'Calculate your possible\nwinnings',
              ),
              PageViewItemBetCalculator(
                image: AppImages.pageViewTrhee,
                title: 'Strategies',
                subTitle: 'Maximize your chances\nto success',
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    CustomButtonBetCalculator(
                      color: AppColors.color144D87,
                      onPress: () async {
                        final isBuy = await PremiumBetCalculator.getPremium();
                        if (currantPage == 2) {
                          await FirstOpenBetCalculator.setFirstOpen();
                          if (!isBuy) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PremiumScreen(),
                              ),
                              (protected) => false,
                            );
                          } else {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigatorScreen(),
                              ),
                              (protected) => false,
                            );
                          }
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      text: 'Next',
                      textStyle: AppTextStylesBetCalculator.s24W600(
                          color: Colors.white),
                    ),
                    const SizedBox(height: 22),
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.white,
                        dotColor: AppColors.colorAFAFAF,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                    const SizedBox(height: 22),
                    RestoreButtons(
                      onPressTermOfService: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebFFBetCalculator(
                              title: 'Term of use',
                              url: DocFFBetCalculator.tUse,
                            ),
                          ),
                        );
                      },
                      onPressRestore: () async {
                        await PremiumBetCalculator.buyTradeFuncRestore(context);
                      },
                      onPressPrivacyPolicy: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebFFBetCalculator(
                              title: 'Privacy Policy',
                              url: DocFFBetCalculator.pP,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
