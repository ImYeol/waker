import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/Models/FriendListItem.dart';
import 'package:flutter_study_app/Utils/ItemUpdateCommand.dart';

class FriendListView extends StatefulWidget {
  
  final double height;
  final double width;
  final Stream<FriendListItem> stream;

  FriendListView({Key key, this.height, this.width, @required this.stream})
        : super(key: key);

  @override
  _FreindListViewState createState() => _FreindListViewState();
  
}

class _FreindListViewState extends State<FriendListView> {

  List<Friend> items = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(widget == null) print("widget is null");
    print("friend list view build--");
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: StreamBuilder(
        stream: widget.stream,
        builder: (context, AsyncSnapshot<FriendListItem> snapshot) {
          print("friend list view builder");
          if(snapshot.hasData) {
            print("snapshot hasdata : ${snapshot.data.cmd}");
            switch(snapshot.data.cmd) {
              case ItemUpdateCommand.INIT :
              if(items == null) print("items null on friend list");
                items.clear();
                items.addAll(snapshot.data.results);
                break;
              case ItemUpdateCommand.ADD:
                            if(items == null) print("items null on friend list");
                items.addAll(snapshot.data.results);
                break;
              case ItemUpdateCommand.DELETE:
                            if(items == null) print("items null on friend list");
                items.removeWhere((item) => item.name == snapshot.data.results[0].name);
                break;
              case ItemUpdateCommand.UPDATE:
                            if(items == null) print("items null on friend list");
                print("items update - ${items.toString()}");
                items.forEach((item) {
                  print("iter : ${item.name} : ${snapshot.data.results[0].name}");
                  if(item.name == snapshot.data.results[0].name){
                    item.isOnline = snapshot.data.results[0].isOnline;
                  }
                });
                break;
            }
            return buildItems();
          } else if(snapshot.hasError) {
            print("friend list snapshot has error");
            return Text(snapshot.data.toString()); 
          }
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }

  Widget buildItems() {
    print("items friend: ${items.length}");
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(top:10, right: 30),
              child: Column(
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: items[index].isOnline? Colors.orange : Colors.grey),
                    ),
                    SizedBox(height: 5,),
                    Text(items[index].name, style: TextStyle(color: Colors.purple, fontFamily: 'Graphik',fontSize: 15.0))
                  ]
              ),
          ); 
        },)
    );
  }
}