class Strategies {
  String? title;
  String? image;
  String? subTitle;

  Strategies({this.title, this.image, this.subTitle});

  Strategies.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    subTitle = json['subTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['subTitle'] = subTitle;
    return data;
  }
}
