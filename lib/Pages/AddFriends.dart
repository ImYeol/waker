import 'package:flutter/material.dart';

class AddFriends extends StatefulWidget {
  
  @override
  _AddFriendsState createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          title: Text(
            "AddFriends",
            style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: Colors.black
                    ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: (){},
            ),
          ],
        ),
          backgroundColor: Colors.transparent,
          body: ListView(
            children: <Widget>[

            ],
          ),
        ),
      );
  }
}