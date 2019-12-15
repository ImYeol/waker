import 'package:flutter/material.dart';
import 'package:flutter_study_app/Models/NotificationItem.dart';
import 'package:flutter_study_app/Utils/ItemUpdateCommand.dart';

class NotificationListView extends StatefulWidget {
  
  final double height;
  final double width;
  final Stream<NotificationItem> stream;

  NotificationListView({Key key, this.height, this.width, @required this.stream})
        : super(key: key);

  @override
  _NotificationListView createState() => _NotificationListView();
  
}

class _NotificationListView extends State<NotificationListView> {

  List<Noti> items = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        print("noti list view build--");
    return StreamBuilder(
        stream: widget.stream,
        builder: (context, AsyncSnapshot<NotificationItem> snapshot) {
          print("noti list view builder");
          if(snapshot.hasData) {
            switch(snapshot.data.cmd) {
              case ItemUpdateCommand.INIT :
                if(items == null) print("items null on noti");
                items.clear();
                items.addAll(snapshot.data.results);
                break;
              case ItemUpdateCommand.ADD:
              if(items == null) print("items null on noti");
                items.addAll(snapshot.data.results);
                break;
              case ItemUpdateCommand.DELETE:
              if(items == null) print("items null on noti");
                items.removeWhere((item) => item.name == snapshot.data.results[0].name);
                break;
              case ItemUpdateCommand.UPDATE:
                // TODO: Handle this case.
                break;
            }
            return buildItems();
          } else if(snapshot.hasError) {
            print("Notification list snapshot has error");
            return Text(snapshot.data.toString()); 
          }
          return Center(child: CircularProgressIndicator());
        },
    );
  }

  Widget buildItems() {
        print("items noti: ${items.length}");
  return  Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.purple,
            thickness: 1,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(top:10, left: 20, right: 20, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Icon(Icons.notifications,color: Colors.purple),
                Text("${items[index].name} ${getStudyState(items[index].state)}",style: TextStyle(color: Colors.purple, fontFamily: 'Graphik',fontSize: 15.0)),
                Text("${getTimeInfo(index)}", style: TextStyle(color: Colors.purple, fontFamily: 'Graphik',fontSize: 15.0))
              ],
            ),
          ),
        )
      )
    );
  }

  String getStudyState(int state) {
    if(state == 1) {
      return "starts";
    } else if(state == 2) {
      return "finishs";
    } else if(state == 3) {
      return "breaks up";
    }
    return "";
  }
  String getTimeInfo(int index) {
    return "${items[index].hour}:${items[index].minute} ${items[index].year}/${items[index].month}/${items[index].day}";
  }
}