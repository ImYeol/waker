import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';

class BoardPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black),
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
      body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/home2.jpg', height: 400, ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(Icons.people, size: 70, color: Colors.white,),
                ),
                Column(
                  children: [
                    Text('{ID}s Profile',style: TextStyle(fontSize:30, color: Colors.white, fontFamily: 'Futura')),
                    Text('Total time:{time}', style: TextStyle(fontSize:20, color: Colors.white, fontFamily: 'Futura')),
                  ]
                )
              ]
            ),
            SizedBox(height: 20,),
            RaisedButton(
              
              child: Text('start study',style: TextStyle(fontSize: 50, color: Colors.white, fontFamily: 'Futura')),
              colorBrightness: Brightness.light,
              onPressed: (){
              },
            ),
          ],
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