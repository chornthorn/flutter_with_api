import 'package:flutter/material.dart';
import 'package:flutter_with_api/views/pages/home_page.dart';
import 'package:flutter_with_api/views/pages/more_page.dart';
import 'package:flutter_with_api/views/pages/photos_page.dart';
import 'package:flutter_with_api/views/pages/user_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _screenList = [HomePage(), PhotosPage(), UserPage(), MorePage()];
  int currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    print(currentIndexPage);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.history),
        onPressed: () {},
      ),
      body: PageView(
        children: [_screenList[currentIndexPage]],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: currentIndexPage == 0 ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    this.currentIndexPage = 0;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.photo,
                  color: currentIndexPage == 1 ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    this.currentIndexPage = 1;
                  });
                },
              ),
              SizedBox(width: 40),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: currentIndexPage == 2 ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    this.currentIndexPage = 2;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: currentIndexPage == 3 ? Colors.blue : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    this.currentIndexPage = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
