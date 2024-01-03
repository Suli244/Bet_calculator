class Referees {
  String? name;
  String? country;
  String? type;
  String? image;
  String? description;

  Referees({this.name, this.country, this.type, this.image, this.description});

  Referees.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    type = json['type'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['country'] = country;
    data['type'] = type;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}
