import 'package:flutter/material.dart';
import 'package:flutter_study_app/Pages/Board.dart';
import 'package:flutter_study_app/Pages/Feed.dart';
import 'package:flutter_study_app/Pages/Home.dart';
import 'package:flutter_study_app/Pages/SessionInformation.dart';
import 'package:flutter_study_app/Pages/Sessions.dart';
import 'package:flutter_study_app/Widgets/Icon_badge.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PageList extends StatefulWidget {
  
  @override
  _MyPageListState createState() => _MyPageListState();
}

class _MyPageListState extends State<PageList> {
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: PageView(
        children: <Widget>[
          BoardPage(),
          SessionInformation()
        ],
      ),
    );
  }
}