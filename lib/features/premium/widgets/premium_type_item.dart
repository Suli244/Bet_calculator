import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PremiumTypeItem extends StatelessWidget {
  const PremiumTypeItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 13),
          Image.asset(
            AppImages.checkIcon,
            width: 23,
          ),
          const SizedBox(width: 13),
          Text(
            'Unlimited use of the calculator',
            style: AppTextStylesBetCalculator.s18W500(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
