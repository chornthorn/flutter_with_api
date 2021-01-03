class PostModel {
  int userId;
  int id;
  String url;
  String title;
  String body;

  PostModel({this.userId, this.id, this.url, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    url = json['url'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['url'] = this.url;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
