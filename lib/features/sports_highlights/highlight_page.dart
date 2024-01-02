import 'package:bet_calculator/features/sports_highlights/widgets/youtube_player_widget_dateil.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SportsHighlightsDateilPage extends StatelessWidget {
  const SportsHighlightsDateilPage(
      {super.key, required this.url, required this.date});
  final String url;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBetCalculator(
        title: 'Highlight',
        titleTextStyle: AppTextStylesBetCalculator.s20W600(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            YoutubePlayeR(
              title: 'Key Plays and Moments',
              url: url,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Spacer(),
                Text(
                  date,
                  style: AppTextStylesBetCalculator.s18W500(),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
