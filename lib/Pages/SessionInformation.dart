import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_study_app/Blocs/SessionInformationBloc.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';
import 'package:flutter_study_app/Widgets/FriendListView.dart';
import 'package:flutter_study_app/Widgets/NotificationListView.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SessionInformation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SessionInformationState();
}

class _SessionInformationState extends State<SessionInformation> {
  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(200.0, 200.0);
  SessionInformationBloc _sessionBloc;
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _sessionBloc = AppBlocProvider.of(context).sessionBloc;
    //_sessionBloc.fetchAllFriendList();
    //_sessionBloc.fetchAllNotification();
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _sessionBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold (
        backgroundColor: Colors.purple,
        body: SafeArea(
          child: getFriendsInfoSlidingUpWidget(),
        )
    );
  }
  Widget getSubTitle(String title, double fontSize, Color color) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Text(title,style: TextStyle(color: color, fontFamily: 'Graphik',fontSize: fontSize, fontWeight: FontWeight.bold))
    );
  }
  Widget getLineWidget(){
      return Padding(
              child: Divider(
                color:
                    Colors.white.withAlpha(100),
                thickness: 1,
              ),
              padding: EdgeInsets.only(left: 20, right: 20),
      );
  }
  
  Widget getFriendsInfoSlidingUpWidget() {
    return SlidingUpPanel(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
      minHeight: 150,
      panel: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 180),
              child: Divider(thickness: 3, color: Colors.purple,)
            ),
            getSubTitle("Online", 20.0, Colors.purple),
            getFriendsState(),
            getSubTitle("Notifications", 20.0, Colors.purple),
            getNotifications()
          ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40.0),
            getSubTitle("Session\nInformation", 40.0, Colors.white),
            SizedBox(height: 30.0),
            getSubTitle("Time", 20.0, Colors.white),
            getDayChartUI()
          ],
      )
    );
  }
  Widget getFriendsState() {
    print("getFriendsState");
    _sessionBloc.fetchAllFriendList();

    return FriendListView(height: 100, width: MediaQuery.of(context).size.width, stream: _sessionBloc.friendList);
  }
 
  Widget getNotifications() {
    print("getNotifications");
    _sessionBloc.fetchAllNotification();

    return NotificationListView(stream: _sessionBloc.notificationList);
  }
 
  Widget getChartUI(){
    return  AnimatedCircularChart(
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
                fontSize: 20.0,
              ),
            );
  }
  Widget getDayChartUI() {
    return Container(
      //padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getSubTitle("Month", 15.0, Colors.purple),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30,),
                  Center(child: getSubTitle("Average", 25.0, Colors.purple),),
                  Center(child: getSubTitle("15 Hour", 15.0, Colors.purple),),
                ],),
                getChartUI()
            ],)
          ]
        )
    )
    ); 
  }
  
}

