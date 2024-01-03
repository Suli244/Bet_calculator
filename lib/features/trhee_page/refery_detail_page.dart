import 'package:bet_calculator/features/trhee_page/models/referees_model.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ReferyDetailPage extends StatelessWidget {
  const ReferyDetailPage({required this.data, super.key});
  final Referees data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              image: NetworkImage(data.image!)),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        '${data.name} (${data.country})',
                        style: AppTextStylesBetCalculator.s24W600(),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data.type!,
                        style: AppTextStylesBetCalculator.s20W500(),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        data.description!,
                        style: AppTextStylesBetCalculator.s16W400(height: 2),
                      ),
                      const SizedBox(height: 24)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                left: 20,
                top: 64,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
