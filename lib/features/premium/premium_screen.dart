import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/core/premium/premium.dart';
import 'package:bet_calculator/features/bottom_navigator/bottom_naviator_screen.dart';
import 'package:bet_calculator/features/on_boarding/widget/page_view_item_bet_calculator.dart';
import 'package:bet_calculator/features/premium/widgets/premium_type_item.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/custom_button.dart';
import 'package:bet_calculator/widgets/restore_widgets.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key, this.isClose = false});

  final bool isClose;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const PageViewItemBetCalculator(
          image: AppImages.premium,
          title: 'Premium',
          subTitle: 'Get access to all features\nwith Premium Version',
          isPremium: true,
        ),
        Positioned(
          top: 10,
          right: 20,
          child: Builder(builder: (context) {
            return SafeArea(
              child: InkWell(
                onTap: () {
                  if (isClose) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigatorScreen(),
                      ),
                      (protected) => false,
                    );
                  }
                },
                child: const Icon(
                  Icons.close_rounded,
                  size: 35,
                  color: AppColors.colorAFAFAF,
                ),
              ),
            );
          }),
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
                  const PremiumTypeItem(
                    text: 'Unlimited use of the calculator',
                  ),
                  const SizedBox(height: 12),
                  const PremiumTypeItem(
                    text: 'History of the calculator',
                  ),
                  const SizedBox(height: 12),
                  const PremiumTypeItem(
                    text: 'Without advertising',
                  ),
                  const SizedBox(height: 44),
                  CustomButtonBetCalculator(
                    color: AppColors.color144D87,
                    onPress: () async {
                      await PremiumBetCalculator.setPremium();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigatorScreen(),
                        ),
                        (protected) => false,
                      );
                    },
                    text: 'Buy Premium for \$0,99',
                    textStyle:
                        AppTextStylesBetCalculator.s20W600(color: Colors.white),
                  ),
                  const SizedBox(height: 44),
                  RestoreButtons(
                    onPressTermOfService: () {},
                    onPressRestore: () {},
                    onPressPrivacyPolicy: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    )
        // PageViewItem(
        //   onTapX: () {
        //     Navigator.pushAndRemoveUntil(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const BottomNavigatorScreen(),
        //       ),
        //       (route) => false,
        //     );
        //   },
        //   isSmoothPageIndicator: false,
        //   isX: true,
        //   title: 'Strategies',
        //   titleTwo: 'Get access to all features\n with Premium Version',
        //   titleNext: 'Buy Premium for \$0,99',
        //   image: AppImages.premium,
        //   onPressNext: () {
        //     Navigator.pushAndRemoveUntil(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const BottomNavigatorScreen(),
        //       ),
        //       (route) => false,
        //     );
        //   },
        //   textStyleNext: AppTextStylesBetCalculator.s20W600(color: Colors.white),
        // ),
        );
  }
}
