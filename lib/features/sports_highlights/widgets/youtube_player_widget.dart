import 'package:bet_calculator/features/sports_highlights/highlight_page.dart';
import 'package:bet_calculator/features/sports_highlights/logic/video_model.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatefulWidget {
  const YoutubePlayerWidget({
    super.key,
    required this.model,
  });

  final VideoModel model;

  @override
  State<YoutubePlayerWidget> createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  ////////// YoutubePlayer Url
  late final videoID = YoutubePlayer.convertUrlToId(
    widget.model.video,
  );
  late final controller = YoutubePlayerController(
    initialVideoId: videoID!,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SportsHighlightsDateilPage(
                model: widget.model,
              ),
            ),
          );
          SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp],
          );
        },
        child: Stack(
          children: [
            //////// YoutubePlayer IgnorePointer
            IgnorePointer(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 200,
                  child: YoutubePlayer(controller: controller),
                ),
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
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
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
                  children: [
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        widget.model.title,
                        style: AppTextStylesBetCalculator.s20W600(
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
