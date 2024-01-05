import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/core/premium/premium.dart';
import 'package:bet_calculator/core/shared_keys.dart';
import 'package:bet_calculator/core/validators/validator.dart';
import 'package:bet_calculator/features/premium/premium_screen.dart';
import 'package:bet_calculator/features/two_page/history_screen.dart';
import 'package:bet_calculator/features/two_page/models/system_model/system_hive_model.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/app_unfocuser.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:bet_calculator/widgets/custom_button.dart';
import 'package:bet_calculator/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SystemCalculatorScreen extends StatefulWidget {
  const SystemCalculatorScreen({super.key});

  @override
  State<SystemCalculatorScreen> createState() => _SystemCalculatorScreenState();
}

class _SystemCalculatorScreenState extends State<SystemCalculatorScreen> {
  int stakeAmount = 0;
  int systemType = 1;
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
                    await Hive.openBox<SystemHiveModel>(SharedKeys.system);
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
                    final incomeBox =
                        await Hive.openBox<SystemHiveModel>(SharedKeys.system);
                    await incomeBox.add(
                      SystemHiveModel(
                        systemType: systemType.toString(),
                        result: calculateResult(),
                        stakeAmount: stakeAmount.toString(),
                        from: number.toString(),
                        coefficients: coefficientControllers
                            .map<int>(
                              (e) => int.parse(e.text),
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
          title: 'System calculator',
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
                        type: SharedKeys.system,
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
                  number: systemType,
                  validator: emptyValidator,
                  labelText: 'System type',
                  onChanged: (val) {
                    systemType = int.parse(val);
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
                  labelText: 'From',
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
                CustomTextFieldBatCalculator(
                  validator: emptyValidator,
                  labelText: 'Stake amount',
                  isDollar: true,
                  onChanged: (val) {
                    stakeAmount = int.parse(val);
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
                              keyboardType: TextInputType.text,
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
    List<double> coefficients = [];
    for (int i = 0; i < number; i++) {
      coefficients.add(double.tryParse(coefficientControllers[i].text) ?? 1);
    }

    double totalWinning = 0.0;

    for (int i = 1; i <= systemType; i++) {
      List<List<int>> combinations = generateCombinations(number, i);

      for (List<int> combination in combinations) {
        double combinationWinning = stakeAmount.toDouble();

        for (int index in combination) {
          combinationWinning *= coefficients[index];
        }

        totalWinning += combinationWinning;
      }
    }

    return totalWinning.toStringAsFixed(2);
  }

  List<List<int>> generateCombinations(int n, int r) {
    List<List<int>> combinations = [];
    List<int> combination = List<int>.filled(r, 0);

    void generate(int i, int next) {
      if (i == r) {
        combinations.add([...combination]);
        return;
      }

      for (int j = next; j < n; j++) {
        combination[i] = j;
        generate(i + 1, j + 1);
      }
    }

    generate(0, 0);

    return combinations;
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
