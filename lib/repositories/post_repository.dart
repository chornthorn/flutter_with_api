import 'package:flutter_with_api/models/post_model.dart';
import 'package:flutter_with_api/services/post_service.dart';

class PostRepository {
  PostService service = PostService();
  Future<List<PostModel>> postList() async {
    return await service.getPost();
  }
}
