import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/app_unfocuser.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:bet_calculator/widgets/custom_button.dart';
import 'package:bet_calculator/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';

class SystemCalculatorScreen extends StatelessWidget {
  const SystemCalculatorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButtonBetCalculator(
              text: 'Calculate',
              color: AppColors.color144D87,
              onPress: () {},
            ),
          ),
        ),
        appBar: CustomAppBar(
          title: 'System calculator',
          titleTextStyle: AppTextStylesBetCalculator.s20W600(),
          actions: [
            Image.asset(
              AppImages.historyIcon,
              width: 25,
            ),
            const SizedBox(width: 25),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 22),
              Text(
                '\$0',
                style: AppTextStylesBetCalculator.s48W600(),
              ),
              const SizedBox(height: 8),
              Text(
                'Result',
                style: AppTextStylesBetCalculator.s16W600(
                  color: AppColors.color00000050,
                ),
              ),
              const SizedBox(height: 22),
              const CustomTextFieldBatCalculator(
                labelText: 'System type',
              ),
              const SizedBox(height: 22),
              const CustomTextFieldBatCalculator(
                labelText: 'From',
              ),
              const SizedBox(height: 22),
              const CustomTextFieldBatCalculator(
                labelText: 'Stake amount',
                isDollar: true,
              ),
              const SizedBox(height: 22),
              const CustomTextFieldBatCalculator(
                labelText: 'Coefficient 1st rate',
              ),
              const SizedBox(height: 22),
              const CustomTextFieldBatCalculator(
                labelText: 'Coefficient 2st rate',
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
    );
  }
}
