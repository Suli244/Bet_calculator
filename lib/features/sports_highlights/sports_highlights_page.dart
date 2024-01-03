import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/features/sports_highlights/highlight_page.dart';
import 'package:bet_calculator/features/sports_highlights/widgets/show_date_dilaog.dart';
import 'package:bet_calculator/features/sports_highlights/widgets/youtube_player_widget.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SportsHighlightsPage extends StatefulWidget {
  const SportsHighlightsPage({super.key});

  @override
  State<SportsHighlightsPage> createState() => _SportsHighlightsPageState();
}

class _SportsHighlightsPageState extends State<SportsHighlightsPage> {
  DateTime toDay = DateTime.now();
  final String url =
      'https://www.youtube.com/watch?v=NijhILXaftE&pp=ygUf0LLQvtC70LXQudCx0L7QuyDQvNC-0LzQtdC90YLRiw%3D%3D';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarBetCalculator(
        title: 'Sports highlights',
        titleTextStyle: AppTextStylesBetCalculator.s24W600(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose the date',
              style: AppTextStylesBetCalculator.s16W500(),
            ),
            const SizedBox(height: 5),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                final dateFrom = await showDateDialog(context, toDay);

                setState(() {
                  toDay = dateFrom;
                });
                print(dateFrom);
              },
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
                    Text(
                      DateFormat('dd/MM/yyyy').format(toDay),
                      style: AppTextStylesBetCalculator.s16W500(),
                    ),
                    const Spacer(),
                    Image.asset(
                      AppImages.calendarIcon,
                      width: 25,
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => YoutubePlayerWidget(
                  url: url,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SportsHighlightsDateilPage(
                          url: url,
                          date: DateFormat('dd/MM/yyyy').format(toDay),
                        ),
                      ),
                    );
                  },
                  title: 'Key Plays and Moments',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
