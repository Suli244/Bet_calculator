class VideoModel {
  final String title;
  final String video;
  final String poster;
  final String date;

  VideoModel({
    required this.title,
    required this.video,
    required this.poster,
    required this.date,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        title: json["strEvent"],
        video: json["strVideo"],
        poster: json["strPoster"],
        date: json["dateEvent"],
      );
}
