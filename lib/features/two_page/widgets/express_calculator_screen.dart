import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/app_unfocuser.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:bet_calculator/widgets/custom_button.dart';
import 'package:bet_calculator/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpressCalculatorScreen extends StatefulWidget {
  const ExpressCalculatorScreen({super.key});

  @override
  State<ExpressCalculatorScreen> createState() =>
      _ExpressCalculatorScreenState();
}

class _ExpressCalculatorScreenState extends State<ExpressCalculatorScreen> {
  int stakeAmount = 0;
  int number = 2;
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
          title: 'Express calculator',
          titleTextStyle: AppTextStylesBetCalculator.s20W600(),
          actions: [
            Image.asset(
              AppImages.historyIcon,
              width: 25,
            ),
            const SizedBox(width: 25),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            Center(
              child: Column(
                children: [
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
                ],
              ),
            ),
            CustomTextFieldBatCalculator(
              labelText: 'Stake amount',
              isDollar: true,
              onChanged: (val) {
                setState(() {
                  stakeAmount = int.parse(val);
                });
              },
            ),
            const SizedBox(height: 22),
            CustomTextFieldBatCalculator(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(
                    r'^([1-9]|1[0-9]|20)?$')), // Allow values from 1 to 20
              ],
              number: 2,
              labelText: 'Number of outcomes',
              onChanged: (val) {
                setState(() {
                  number = int.parse(val);
                });
              },
            ),
            const SizedBox(height: 22),
            Column(
              children: List.generate(number, (index) => index + 1)
                  .map<Widget>(
                    (e) => Column(
                      children: [
                        CustomTextFieldBatCalculator(
                          labelText: 'Coefficient $e${type(e)} rate',
                        ),
                        const SizedBox(height: 22),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

String type(int number) {
  switch (number) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
