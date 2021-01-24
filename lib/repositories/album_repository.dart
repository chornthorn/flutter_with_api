import 'package:flutter_with_api/models/album_model.dart';
import 'package:flutter_with_api/services/album_service.dart';

class AlbumRepository {
  final AlbumService _service = new AlbumService();

  Future<List<AlbumModel>> albumList() async {
    return await _service.getAlbum();
  }
}
