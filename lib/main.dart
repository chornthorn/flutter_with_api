import 'package:flutter/material.dart';
import 'package:flutter_with_api/routes/route_app.dart';

void main() => runApp(AppIndex());

class AppIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
