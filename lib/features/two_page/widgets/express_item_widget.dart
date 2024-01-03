import 'package:bet_calculator/features/two_page/models/express_model/express_hive_model.dart';
import 'package:bet_calculator/features/two_page/widgets/express_calculator_screen.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpressItemWidget extends StatelessWidget {
  const ExpressItemWidget({super.key, required this.model});
  final ExpressHiveModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Result: \$${model.result}',
                  style: AppTextStylesBetCalculator.s16WBold(),
                ),
                Text(
                  DateFormat('dd.MM.yyyy').format(model.date),
                  style: AppTextStylesBetCalculator.s12W400(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Stake amount: ',
                  style: AppTextStylesBetCalculator.s14W400(),
                ),
                Text(
                  model.stakeAmount,
                  style: AppTextStylesBetCalculator.s14W500(
                    color: AppColors.color039AFF,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Number of outcomes: ',
                  style: AppTextStylesBetCalculator.s14W400(),
                ),
                Text(
                  model.number,
                  style: AppTextStylesBetCalculator.s14W500(
                    color: AppColors.color039AFF,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: model.coefficients.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) => Row(
                children: [
                  Text(
                    'Coefficient ${index + 1}${type(index)}: ',
                    style: AppTextStylesBetCalculator.s14W400(),
                  ),
                  Text(
                    model.coefficients[index].toString(),
                    style: AppTextStylesBetCalculator.s14W500(
                      color: AppColors.color039AFF,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
