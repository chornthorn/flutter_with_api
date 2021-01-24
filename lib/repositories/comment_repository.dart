import 'package:flutter_with_api/models/comment_model.dart';
import 'package:flutter_with_api/services/comment_service.dart';

class CommentRepository {
  final CommentService _service = new CommentService();

  Future<List<CommentModel>> commentList({int postId}) async {
    return await _service.getComment(postId: postId);
  }
}
