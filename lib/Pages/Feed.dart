import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
/*    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Color(0xFFFA7A86) : Color(0xFF3F3D62);
    Color textColor = data['isDaytime'] ? Colors.black : Colors.black;
*/
    return Scaffold(
      backgroundColor: Color(0xFFFA7A86),
      body: Text(
                  //data['time'],
                  'FeedPage',
                  style: TextStyle(
                    fontSize: 60,
                    color: Color(0xFF3F3D62),
                  ),
                )
    );
  }
}