import 'dart:convert';

import 'package:flutter_with_api/models/photos_model.dart';
import 'package:flutter_with_api/utils/strings.dart';
import 'package:http/http.dart' as http;

class PhotosService {
  Future<List<PhotosModel>> getPhotos() async {
    final response = await http.get('${Strings.BASE_URL}/photos');
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as List;
      return result.map((data) => new PhotosModel.fromJson(data)).toList();
    } else {
      throw Exception("Unable to get post list");
    }
  }

  Future<List<PhotosModel>> getPhotosByAlbumId({int albumId}) async {
    final response =
        await http.get('${Strings.BASE_URL}/photos?albumId=$albumId');
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as List;
      return result.map((data) => new PhotosModel.fromJson(data)).toList();
    } else {
      throw Exception("Unable to get photos list");
    }
  }

  Future<void> deletePhotos() async {
    final response = await http.get('${Strings.BASE_URL}/photos');
    if (response.statusCode == 200) {
    } else {
      throw Exception("Unable to get post list");
    }
  }
}
