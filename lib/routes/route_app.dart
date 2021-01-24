import 'package:flutter/material.dart';
import 'package:flutter_with_api/views/pages/album_page.dart';
import 'package:flutter_with_api/views/pages/comment_page.dart';
import 'package:flutter_with_api/views/pages/home_page.dart';
import 'package:flutter_with_api/views/pages/main_page.dart';
import 'package:flutter_with_api/views/pages/more_page.dart';
import 'package:flutter_with_api/views/pages/photos_detail_page.dart';
import 'package:flutter_with_api/views/pages/photos_page.dart';
import 'package:flutter_with_api/views/pages/post_detail_page.dart';
import 'package:flutter_with_api/views/pages/post_page.dart';
import 'package:flutter_with_api/views/pages/user_page.dart';

Route onGenerateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => MainPage());
    case '/home':
      return MaterialPageRoute(builder: (_) => HomePage());
    case '/user':
      return MaterialPageRoute(builder: (_) => UserPage());
    case '/post':
      return MaterialPageRoute(builder: (_) => PostPage());
    case '/comment':
      return MaterialPageRoute(builder: (_) => CommentPage());
    case '/photos':
      return MaterialPageRoute(
        builder: (_) => PhotosPage(albumId: args),
      );
    case '/album':
      return MaterialPageRoute(builder: (_) => AlbumPage());
    case '/more':
      return MaterialPageRoute(builder: (_) => MorePage());
    case '/photos_detail':
      return MaterialPageRoute(builder: (_) => PhotosDetailPage());
    case '/post_detail':
      return MaterialPageRoute(builder: (_) => PostDetailPage(data: args));
  }
  return onGenerateRoute(settings);
}
