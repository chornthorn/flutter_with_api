import 'dart:convert';

import 'package:flutter_with_api/models/post_model.dart';
import 'package:flutter_with_api/utils/strings.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<PostModel>> getPost() async {
    final response = await http.get('${Strings.BASE_URL}/posts');
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as List;
      return result.map((data) => new PostModel.fromJson(data)).toList();
    } else {
      throw Exception("Unable to get post list");
    }
  }

  // Future<List<PostModel>> getPhotosByAlbumId({int albumId}) async {
  //   final response =
  //       await http.get('${Strings.BASE_URL}/photos?albumId=$albumId');
  //   if (response.statusCode == 200) {
  //     var result = jsonDecode(response.body) as List;
  //     return result.map((data) => new PhotosModel.fromJson(data)).toList();
  //   } else {
  //     throw Exception("Unable to get photos list");
  //   }
  // }
}
