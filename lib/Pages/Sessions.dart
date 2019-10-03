import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  @override
  _SessionPageState createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
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
                  'SessionPage',
                  style: TextStyle(
                    fontSize: 60,
                    color: Color(0xFF3F3D62),
                  ),
                )
    );
  }
}