import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_api/models/album_model.dart';
import 'package:flutter_with_api/repositories/album_repository.dart';

class AlbumPage extends StatefulWidget {
  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  Future<List<AlbumModel>> dataList;
  AlbumRepository repository;
  @override
  void initState() {
    repository = new AlbumRepository();
    dataList = repository.albumList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album Page'),
      ),
      body: FutureBuilder<List<AlbumModel>>(
        future: dataList,
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
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/photos', arguments: data.id);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(
                                right: 16, left: 16, bottom: 16),
                            child: Text(data.title),
                          ),
                        ],
                      ),
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
