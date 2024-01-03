import 'package:bet_calculator/features/sports_highlights/logic/video_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'get_video_cubit.freezed.dart';
part 'get_video_state.dart';

class GetVideoCubit extends Cubit<GetVideoState> {
  GetVideoCubit() : super(const GetVideoState.loading()) {
    getVideo(
      DateFormat('yyyy-MM-dd').format(DateTime.now()),
      'Soccer',
    );
  }

  final dio = Dio(
    BaseOptions(
      headers: {
        'X-RapidAPI-Key': '3401a96be2msh45b8ca512eadd61p166194jsn2983e33bb4c8'
      },
    ),
  );

  List<VideoModel> videos = [];

  getVideo(String date, String sport) async {
    emit(const GetVideoState.loading());
    try {
      final response = await dio.get(
        'https://www.thesportsdb.com/api/v1/json/60130162/eventshighlights.php',
        queryParameters: {
          's': sport,
          'd': date,
        },
      );

      if (response.data['tvhighlights'] != null) {
        for (var e in response.data['tvhighlights']) {
          final model = VideoModel.fromJson(e);
          videos.add(model);
        }
      }

      emit(GetVideoState.success(videos));
    } catch (e) {
      emit(GetVideoState.error(e.toString()));
    }
  }
}
