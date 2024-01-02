import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class RestoreButtons extends StatelessWidget {
  const RestoreButtons({
    super.key,
    required this.onPressTermOfService,
    required this.onPressRestore,
    required this.onPressPrivacyPolicy,
  });

  final Function() onPressTermOfService;
  final Function() onPressRestore;
  final Function() onPressPrivacyPolicy;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        InkWell(
          onTap: onPressTermOfService,
          child: Text(
            'Term of Service',
            style: AppTextStylesBetCalculator.s15W400(color: Colors.white),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onPressRestore,
          child: Text(
            'Restore',
            style: AppTextStylesBetCalculator.s15W400(color: Colors.white),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onPressPrivacyPolicy,
          child: Text(
            'Privacy Policy',
            style: AppTextStylesBetCalculator.s15W400(color: Colors.white),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
