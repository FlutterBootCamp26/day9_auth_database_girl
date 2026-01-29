class Course {
  String? id;
  String? createdAt;
  String? image;
  double? rating;
  String? title;

  Course({this.id, this.createdAt, this.image, this.rating, this.title});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    image = json['image'];
    rating = json['rating'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['image'] = image;
    data['rating'] = rating;
    data['title'] = title;
    return data;
  }
}
