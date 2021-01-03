import 'package:flutter_with_api/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostService {
  Future<List<PostModel>> getPost() async {
    var baseUrl =
        "https://my-json-server.typicode.com/chornthorn/json-demo/posts";
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body) as List;
      return res.map((data) => new PostModel.fromJson(data)).toList();
    } else {
      throw Exception("Unable to get post list");
    }
  }
}
