import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/core/premium/premium.dart';
import 'package:bet_calculator/core/shared_keys.dart';
import 'package:bet_calculator/core/validators/validator.dart';
import 'package:bet_calculator/features/premium/premium_screen.dart';
import 'package:bet_calculator/features/two_page/history_screen.dart';
import 'package:bet_calculator/features/two_page/models/express_model/express_hive_model.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/app_unfocuser.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:bet_calculator/widgets/custom_button.dart';
import 'package:bet_calculator/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExpressCalculatorScreen extends StatefulWidget {
  const ExpressCalculatorScreen({super.key});

  @override
  State<ExpressCalculatorScreen> createState() =>
      _ExpressCalculatorScreenState();
}

class _ExpressCalculatorScreenState extends State<ExpressCalculatorScreen> {
  int stakeAmount = 0;
  int number = 2;
  List<int> numbersList = [];
  List<TextEditingController> coefficientControllers = [];

  @override
  void initState() {
    numbersList = List.generate(number, (index) => index + 1);
    coefficientControllers = List<TextEditingController>.generate(
      number,
      (index) => TextEditingController(),
    );
    super.initState();
  }

  final controller = ScrollController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppUnfocuser(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: CustomButtonBetCalculator(
              text: 'Calculate',
              color: AppColors.color144D87,
              onPress: () async {
                final incomeBox =
                    await Hive.openBox<ExpressHiveModel>(SharedKeys.express);
                final length = incomeBox.values.toList().length;
                final isPremium = await PremiumBetCalculator.getPremium();

                if (length < 3 || isPremium) {
                  if (formKey.currentState!.validate()) {
                    setState(() {});
                    if (controller.hasClients) {
                      controller.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                    final incomeBox = await Hive.openBox<ExpressHiveModel>(
                        SharedKeys.express);
                    await incomeBox.add(
                      ExpressHiveModel(
                        result: calculateResult(),
                        stakeAmount: stakeAmount.toString(),
                        number: number.toString(),
                        coefficients: coefficientControllers
                            .map<String>(
                              (e) => e.text,
                            )
                            .toList(),
                        date: DateTime.now(),
                      ),
                    );
                  }
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PremiumScreen(
                        isClose: true,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
        appBar: CustomAppBarBetCalculator(
          title: 'Express calculator',
          titleTextStyle: AppTextStylesBetCalculator.s20W600(),
          actions: [
            GestureDetector(
              onTap: () async {
                final isPremium = await PremiumBetCalculator.getPremium();
                if (isPremium) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryScreen(
                        type: SharedKeys.express,
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PremiumScreen(
                        isClose: true,
                      ),
                    ),
                  );
                }
              },
              child: Image.asset(
                AppImages.historyIcon,
                width: 25,
              ),
            ),
            const SizedBox(width: 25),
          ],
        ),
        body: SingleChildScrollView(
          controller: controller,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        '\$${calculateResult()}',
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
                  validator: emptyValidator,
                  labelText: 'Stake amount',
                  isDollar: true,
                  onChanged: (val) {
                    stakeAmount = int.parse(val);
                  },
                ),
                const SizedBox(height: 22),
                CustomTextFieldBatCalculator(
                  validator: emptyValidator,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(
                        r'^([1-9]|1[0-9]|20)?$')), // Allow values from 1 to 20
                  ],
                  number: 2,
                  labelText: 'Number of outcomes',
                  onChanged: (val) {
                    setState(() {
                      number = int.parse(val);
                      numbersList = List.generate(number, (index) => index + 1);
                      coefficientControllers =
                          List<TextEditingController>.generate(
                        number,
                        (index) => TextEditingController(),
                      );
                    });
                  },
                ),
                const SizedBox(height: 22),
                Column(
                  children: numbersList
                      .map<Widget>(
                        (e) => Column(
                          children: [
                            CustomTextFieldBatCalculator(
                              validator: emptyValidator,
                              controller: coefficientControllers[
                                  numbersList.indexOf(e)],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
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
        ),
      ),
    );
  }

  String calculateResult() {
    double totalCoefficient = 1;
    for (int i = 0; i < number; i++) {
      double coefficient = double.tryParse(coefficientControllers[i].text) ?? 1;
      totalCoefficient *= coefficient;
    }
    double totalWinning = stakeAmount * (totalCoefficient - 1);
    return totalWinning.toStringAsFixed(2);
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
