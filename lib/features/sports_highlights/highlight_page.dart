import 'package:bet_calculator/features/sports_highlights/logic/video_model.dart';
import 'package:bet_calculator/features/sports_highlights/widgets/youtube_player_widget_dateil.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SportsHighlightsDateilPage extends StatelessWidget {
  const SportsHighlightsDateilPage({super.key, required this.model});
  final VideoModel model;

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
              title: model.title,
              url: model.video,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Spacer(),
                Text(
                  model.date,
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
