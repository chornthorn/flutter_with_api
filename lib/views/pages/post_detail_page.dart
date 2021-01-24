import 'package:flutter/material.dart';
import 'package:flutter_with_api/models/comment_model.dart';
import 'package:flutter_with_api/models/post_model.dart';
import 'package:flutter_with_api/repositories/comment_repository.dart';

class PostDetailPage extends StatefulWidget {
  final PostModel data;

  const PostDetailPage({Key key, @required this.data}) : super(key: key);
  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  PostModel data;
  Future<List<CommentModel>> commentList;
  CommentRepository commentRepository;
  @override
  void initState() {
    data = widget.data;
    commentRepository = new CommentRepository();
    commentList = commentRepository.commentList(postId: data.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network(
                  data.url,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  title: Text(data.title),
                  subtitle: Text(data.body),
                ),
              ),
            ),
            SizedBox(height: 10),
            FutureBuilder<List<CommentModel>>(
              future: commentList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Please wait...'));
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(snapshot.data[index].name),
                          subtitle: Text(snapshot.data[index].body),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
