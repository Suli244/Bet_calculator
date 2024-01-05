import 'package:bet_calculator/features/one_page/models/strategies_model.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class StrategyDetailPage extends StatelessWidget {
  const StrategyDetailPage({required this.data, super.key});
  final Strategies data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarBetCalculator(
          titleWidget: Text(
        data.title!,
        style: AppTextStylesBetCalculator.s20W600(),
      )),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                data.image!,
                width: MediaQuery.of(context).size.width - 48,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 3,
                    color: AppColors.color039AFF,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    data.title!,
                    style: AppTextStylesBetCalculator.s24W600(),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                data.subTitle!,
                style: AppTextStylesBetCalculator.s16W400(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
