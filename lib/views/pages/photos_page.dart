import 'package:flutter/material.dart';

class PhotosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos Page'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
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
                    child:
                        Image.network('https://via.placeholder.com/600/92c952'),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                    child: Text('The Title here!'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
