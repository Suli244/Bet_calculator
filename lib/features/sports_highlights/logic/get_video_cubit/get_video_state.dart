part of 'get_video_cubit.dart';

@freezed
class GetVideoState with _$GetVideoState {
  const factory GetVideoState.loading() = _Loading;
  const factory GetVideoState.error(String error) = _Error;
  const factory GetVideoState.success(List<VideoModel> model) = _Success;
}
