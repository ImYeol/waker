import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/Utils/group_data.dart';
import 'package:flutter_study_app/Widgets/CustomSearchDelegate.dart';
import 'package:flutter_study_app/Widgets/FeedUIText.dart';
import 'package:flutter_study_app/Widgets/slide_item.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'Sessions.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  Map data = {};
  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(200.0, 200.0);
  int selectedIdx = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        title: Text(
          "Session",
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
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getDayChartUIText(),
            getDayChartUI(),
            getFriendsUIText(),
            getFriendsUI(),
            getFeedListUIText(),
            getFeedListUI()
          ],
        ),
      ),
    );
  }


  Widget getDayChartUIText() {
      return DefaultFeedUIText(title: "Today Chart", subTitle: "see more", onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return SessionPage();
                        },
                      ),
                    );
                  });
  }

  Widget getDayChartUI() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: <Widget>[
          AnimatedCircularChart(
              key: _chartKey,
              size: _chartSize,
              initialChartData: <CircularStackEntry>[
                new CircularStackEntry(
                  <CircularSegmentEntry>[
                    new CircularSegmentEntry(
                      33.33,
                      Colors.blue[400],
                      rankKey: 'completed',
                    ),
                    new CircularSegmentEntry(
                      66.67,
                      Colors.blueGrey[600],
                      rankKey: 'remaining',
                    ),
                  ],
                  rankKey: 'progress',
                ),
              ],
              chartType: CircularChartType.Radial,
              percentageValues: true,
              holeLabel: '1/3',
              labelStyle: new TextStyle(
                color: Colors.blueGrey[600],
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            )]
        )
    );
      
  }

  Widget getFriendsUIText() {
      return DefaultFeedUIText(title: "Friends", subTitle: "Add", onPressed: () {
                    /*Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return SessionPage();
                        },
                      ),
                    );*/
                    
                    //TODO
                   /* showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                    );*/
                  });
  }

  Widget getFriendsUI() {
    // horizontal listView
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              height: 80,
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  //Map cat = myGroups[index];

                  return GestureDetector(
                        onLongPress: () {
                          print("long press ${selectedIdx}");
                          setState(() {
                            selectedIdx = index;
                          });
                        },
                        onDoubleTap: (){
                          print("double tap");
                          setState(() {
                            selectedIdx = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                              backgroundImage: selectedIdx == index ? AssetImage("images/home.jpg") : AssetImage("images/profile_icon2.png"),
                              radius: 25,
                              ),
                              Text("ID")
                            ]
                          )
                        )
                  ); 
                },
              ),
            );
  }


  Widget getFeedListUIText(){
     return DefaultFeedUIText(title: "Friends News", subTitle: "see more", onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context){
                          return SessionPage();
                        },
                      ),
                    );
                  });
  }

  Widget getFeedListUI(){
    return Container(
            height: MediaQuery.of(context).size.height/4,
    
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  Map transaction = myGroups[0];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          transaction['img'],
                        ),
                        radius: 25,
                      ),
                      title: Text("jong su"),
                      subtitle: Text("started to study"),
                      trailing: Text(
                        "10/25 10:30",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },

              )
    );
  }
}