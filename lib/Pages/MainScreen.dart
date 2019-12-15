import 'package:flutter/material.dart';
import 'package:flutter_study_app/Pages/PageList.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: new Swiper(
        itemBuilder: (BuildContext context, int index){
          return PageList();
        },
        itemCount: 2,
        pagination: new SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: SwiperPagination.dots,
        ),
        control: new SwiperControl(
          iconPrevious: Icons.arrow_back_ios,
          size: 20.0,
        ),
        loop: true,
        scrollDirection: Axis.horizontal,
      )
    );
  }
}