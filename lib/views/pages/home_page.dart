import 'package:flutter/material.dart';
import 'package:flutter_with_api/models/post_model.dart';
import 'package:flutter_with_api/repositories/post_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<PostModel>> postList;
  PostRepository postRepository;
  @override
  void initState() {
    postRepository = new PostRepository();
    postList = postRepository.postList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: postList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Please wait...'));
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var data = snapshot.data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/post_detail',
                        arguments: data);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: Image.network(
                          data.url,
                          height: 40,
                          width: 60,
                        ),
                        title: Text(data.title),
                        subtitle: Text(data.body),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
