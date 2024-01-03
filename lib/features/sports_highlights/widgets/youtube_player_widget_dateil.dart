import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayeR extends StatefulWidget {
  const YoutubePlayeR({
    super.key,
    required this.title,
    required this.url,
  });

  final String title;
  final String url;

  @override
  State<YoutubePlayeR> createState() => _YoutubePlayeRState();
}

class _YoutubePlayeRState extends State<YoutubePlayeR> {
  late YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    ////////// YoutubePlayer Url
    final videoID = YoutubePlayer.convertUrlToId(
      widget.url,
    );
    controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    return Stack(
      children: [
        //////// YoutubePlayer
        SizedBox(
          height: 550,
          child: YoutubePlayer(
            controller: controller,
          ),
        ),
        //////// Container gradient
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.00, -1.00),
                end: const Alignment(0, 1),
                colors: [
                  AppColors.color039AFF.withOpacity(0),
                  AppColors.color039AFF,
                ],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 15),
                Center(
                  child: Text(
                    widget.title,
                    style: AppTextStylesBetCalculator.s20W600(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
