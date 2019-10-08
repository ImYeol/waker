import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  String widgets;
  
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    String dataURL = "http://52.79.239.248:5001/a";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = response.body;
    });
  }


  @override
  Widget build(BuildContext context) {
/*    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Color(0xFFFA7A86) : Color(0xFF3F3D62);
    Color textColor = data['isDaytime'] ? Colors.black : Colors.black;
*/
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                      "${widgets}",
                      style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row (

                  children: <Widget>[
                      Card(
                    child: new Container(
                    padding: new EdgeInsets.fromLTRB(100,50,100,50),
                    child: Column(
                      children: <Widget>[
                      Text('Goal : Get the Certi',
                        style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,),
                      ),
                      Text('D-DAY : 2020-01-01',
                        style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,),
                      )
                    ],
                  ),
                ),
              ),
                  ],
                ),          
                SizedBox(height: 250),      
                ProgressButton(
                  defaultWidget:
                      const Text('Start Button', style: TextStyle(fontSize:30, color: Colors.white)),
                  progressWidget: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
                  width: 500,
                  height: 30,
                  type: ProgressButtonType.Flat,
                  borderRadius: 15,
                  color: Colors.blue,
                  onPressed: () async {
                  //dynamic result = await Navigator.pushNamed(context, '/location');
                    int score = await Future.delayed(
                        const Duration(milliseconds: 2000), () => 42);

                  // refresh widget
                    setState(() {
                      /*data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };*/
                      });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}