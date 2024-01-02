import 'package:bet_calculator/core/image/app_images.dart';
import 'package:flutter/material.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    this.onPressNext,
    this.isX = false,
    this.isSmoothPageIndicator = true,
    this.controller,
    required this.title,
    required this.titleTwo,
    this.titleNext,
    required this.image,
    this.textStyleNext,
    this.onPressTermOfService,
    this.onPressRestore,
    this.onPressPrivacyPolicy,
    this.onTapX,
  });

  final String title;
  final String titleTwo;
  final String? titleNext;
  final TextStyle? textStyleNext;
  final String image;
  final bool isX;
  final bool isSmoothPageIndicator;
  final Function()? onPressNext;
  final Function()? onPressTermOfService;
  final Function()? onPressRestore;
  final Function()? onPressPrivacyPolicy;
  final Function()? onTapX;
  final PageController? controller;

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
        isX
            ? Positioned(
                top: 70,
                left: 335,
                child: InkWell(
                  onTap: onTapX ?? () {},
                  child: const Icon(
                    Icons.close_rounded,
                    size: 35,
                    color: AppColors.colorAFAFAF,
                  ),
                ),
              )
            : const SizedBox(),
        isX
            ? Positioned(
                top: 84,
                left: 30,
                child: Row(
                  children: [
                    Text(
                      'Premium',
                      style: AppTextStyles.s40W700(color: Colors.white),
                    ),
                    const SizedBox(width: 15),
                    Image.asset(
                      AppImages.premiumIcon,
                      width: 30,
                    ),
                  ],
                ),
              )
            : Positioned(
                top: 84,
                left: 30,
                child: Text(
                  title,
                  style: AppTextStyles.s40W700(color: Colors.white),
                ),
              ),
        Positioned(
          top: 152,
          left: 30,
          child: Text(
            titleTwo,
            style: AppTextStyles.s24W600(color: Colors.white),
          ),
        ),
        isX
            ? Positioned(
                top: 398,
                left: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 355,
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
                            style: AppTextStyles.s18W500(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 60,
                      width: 355,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
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
                            'History of the calculator',
                            style: AppTextStyles.s18W500(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 60,
                      width: 355,
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
                            'Without advertising',
                            style: AppTextStyles.s18W500(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        Column(
          children: [
            const Text(''),
            const SizedBox(height: 650),
            Center(
              child: CustomButton(
                height: 60,
                width: 355,
                color: AppColors.color144D87,
                onPress: onPressNext ?? () {},
                text: titleNext ?? 'Next',
                textStyle:
                    textStyleNext ?? AppTextStyles.s24W600(color: Colors.white),
              ),
            ),
            const SizedBox(height: 37),
            isSmoothPageIndicator
                ? SmoothPageIndicator(
                    controller: controller ?? PageController(),
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotColor: AppColors.colorAFAFAF,
                      dotHeight: 10,
                      dotWidth: 10,
                      strokeWidth: 90,
                    ),
                  )
                : Opacity(
                    opacity: 0,
                    child: SmoothPageIndicator(
                      controller: controller ?? PageController(),
                      count: 3,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.white,
                        dotColor: AppColors.colorAFAFAF,
                        dotHeight: 10,
                        dotWidth: 10,
                        strokeWidth: 90,
                      ),
                    ),
                  ),
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 39),
                InkWell(
                  onTap: onPressTermOfService ?? () {},
                  child: Text(
                    'Term of Service',
                    style: AppTextStyles.s15W400(color: Colors.white),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: onPressRestore ?? () {},
                  child: Text(
                    'Restore',
                    style: AppTextStyles.s15W400(color: Colors.white),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: onPressPrivacyPolicy ?? () {},
                  child: Text(
                    'Privacy Policy',
                    style: AppTextStyles.s15W400(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 39),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
