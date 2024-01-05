import 'package:apphud/apphud.dart';
import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/core/premium/premium.dart';
import 'package:bet_calculator/core/urls.dart';
import 'package:bet_calculator/features/bottom_navigator/bottom_naviator_screen.dart';
import 'package:bet_calculator/features/on_boarding/widget/page_view_item_bet_calculator.dart';
import 'package:bet_calculator/features/premium/widgets/premium_type_item.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/custom_button.dart';
import 'package:bet_calculator/widgets/restore_widgets.dart';
import 'package:bet_calculator/widgets/web_view_bet_calculator.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key, this.isClose = false});

  final bool isClose;

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool owhevogerivgwecowcyw = false;
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
                  if (widget.isClose) {
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
                    isLoading: owhevogerivgwecowcyw,
                    color: AppColors.color144D87,
                    onPress: () async {
                      setState(() {
                        owhevogerivgwecowcyw = true;
                      });
                      final apphudPaywalls = await Apphud.paywalls();

                      await Apphud.purchase(
                        product: apphudPaywalls?.paywalls.first.products?.first,
                      ).whenComplete(
                        () async {
                          if (await Apphud.hasPremiumAccess() ||
                              await Apphud.hasActiveSubscription()) {
                            await PremiumBetCalculator.buyTradeFuncRestore(
                                context);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const BottomNavigatorScreen(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                      );
                      setState(() {
                        owhevogerivgwecowcyw = false;
                      });
                    },
                    text: 'Buy Premium for \$0,99',
                    textStyle:
                        AppTextStylesBetCalculator.s20W600(color: Colors.white),
                  ),
                  const SizedBox(height: 44),
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
    ));
  }
}
