import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class PageViewItemBetCalculator extends StatelessWidget {
  const PageViewItemBetCalculator({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.isPremium = false,
  });
  final String image;
  final String title;
  final String subTitle;
  final bool isPremium;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          image,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.3),
        ),
        Positioned(
          top: 20,
          left: 30,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTextStylesBetCalculator.s40W700(
                          color: Colors.white),
                    ),
                    const SizedBox(width: 15),
                    if (isPremium)
                      Image.asset(
                        AppImages.premiumIcon,
                        width: 30,
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  subTitle,
                  style:
                      AppTextStylesBetCalculator.s24W600(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
