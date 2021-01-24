import 'dart:convert';

import 'package:flutter_with_api/models/comment_model.dart';
import 'package:flutter_with_api/utils/strings.dart';
import 'package:http/http.dart' as http;

class CommentService {
  Future<List<CommentModel>> getComment({int postId}) async {
    final response =
        await http.get('${Strings.BASE_URL}/comments?postId=$postId');
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as List;
      return result.map((data) => new CommentModel.fromJson(data)).toList();
    } else {
      throw Exception("Unable to get comment list");
    }
  }
}
