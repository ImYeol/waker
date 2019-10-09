import 'dart:io';

import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.green),
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var tmp_time = 0;
  bool isStarted = false;
  _MyHomePageState(){
    print(context.hashCode);
  }

  void toggleTime(){
    if(isStarted){
      isStarted = false;
    }else{
      isStarted = true;
      tmp_time = tmp_time + 1;
      sleep(Duration());
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:  new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Image.asset('images/home2.jpg'),
            ),
            RaisedButton(
              child: Text('start study',style: TextStyle(fontSize: 25, color: Colors.white)),
              colorBrightness: Brightness.light,
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
      ),
    );
  }
  


    // return new FlatButton(
    //   color: Colors.yellow,
    //   textColor: Colors.white,
    //   onPressed: toggleTime,
    //   child: new Text('Start'),
    // );
  
}