import 'package:flutter/material.dart';
import 'package:flutter_study_app/Pages/Board.dart';
import 'package:flutter_study_app/Pages/Feed.dart';
import 'package:flutter_study_app/Pages/Home.dart';
import 'package:flutter_study_app/Pages/Sessions.dart';
import 'package:flutter_study_app/Widgets/Icon_badge.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          HomePage(),
          SessionPage(),
          FeedPage(),
          BoardPage(),
          //MyInfo(),
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Theme.of(context).primaryColor,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.grey[500]),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Container(height: 0.0),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
              ),
              title: Container(height: 0.0),
            ),

            BottomNavigationBarItem(
              icon: IconBadge(
                icon: Icons.notifications,
              ),
              title: Container(height: 0.0),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble,
              ),
              title: Container(height: 0.0),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),

    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}