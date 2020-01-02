import 'dart:math';
import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  String watchState = "STOP";
  bool run = false;
  List<bool> isSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() {
                this.run = !this.run;
              }),
          child: Icon((this.run) ? Icons.stop : Icons.play_arrow)),
      body: Center(
        child: Column(
          children: <Widget>[
            Divider(height: 50.0,),
            
          ]
        )
      ),
    );
  }
}