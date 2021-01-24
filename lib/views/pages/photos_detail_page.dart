import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_api/models/photos_model.dart';
import 'package:flutter_with_api/repositories/photos_repository.dart';

class PhotosDetailPage extends StatefulWidget {
  @override
  _PhotosDetailPageState createState() => _PhotosDetailPageState();
}

class _PhotosDetailPageState extends State<PhotosDetailPage> {
  Future<List<PhotosModel>> postList;
  PhotosRepository photosRepository;
  @override
  void initState() {
    photosRepository = new PhotosRepository();
    postList = photosRepository.photosList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos Detail'),
      ),
      body: FutureBuilder<List<PhotosModel>>(
        future: postList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Platform.isAndroid
                      ? CircularProgressIndicator()
                      : CupertinoActivityIndicator(),
                  SizedBox(height: 10),
                  Text('Please wait...'),
                ],
              ),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var data = snapshot.data[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Image.network(data.url),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(right: 16, left: 16, bottom: 16),
                          child: Text(data.title),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: Text('No have data!'),
          );
        },
      ),
    );
  }
}
