import 'dart:convert';

import 'package:flutter_with_api/models/album_model.dart';
import 'package:flutter_with_api/utils/strings.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  Future<List<AlbumModel>> getAlbum() async {
    final response = await http.get('${Strings.BASE_URL}/albums');
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as List;
      return result.map((data) => new AlbumModel.fromJson(data)).toList();
    } else {
      throw Exception("Unable to get album list");
    }
  }

  Future<void> deleteAlbum() async {
    final response = await http.get('${Strings.BASE_URL}/albums');
    if (response.statusCode == 200) {
    } else {
      throw Exception("Unable to get post list");
    }
  }
}
