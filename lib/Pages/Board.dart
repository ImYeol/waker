import 'package:flutter/material.dart';

class BoardPage extends StatefulWidget {
  @override
  _BoardPageState createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
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
                  'BoardPage',
                  style: TextStyle(
                    fontSize: 60,
                    color: Color(0xFF3F3D62),
                  ),
                )
    );
  }
}