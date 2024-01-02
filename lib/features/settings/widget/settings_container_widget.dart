import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class SettingsContainerWidget extends StatelessWidget {
  const SettingsContainerWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final String icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 5,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 15),
              Image.asset(
                icon,
                width: 30,
              ),
              const SizedBox(width: 15),
              Text(
                text,
                style: AppTextStylesBetCalculator.s16W500(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
