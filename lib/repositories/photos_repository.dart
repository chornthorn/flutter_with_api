import 'package:flutter_with_api/models/photos_model.dart';
import 'package:flutter_with_api/services/photos_service.dart';

class PhotosRepository {
  final PhotosService _service = new PhotosService();

  Future<List<PhotosModel>> photosList() async {
    return await _service.getPhotos();
  }

  Future<List<PhotosModel>> photosListByAlbumId({int albumId}) async {
    return await _service.getPhotosByAlbumId(albumId: albumId);
  }
}
