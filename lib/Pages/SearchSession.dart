import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/SearchSessionBloc.dart';
import 'package:flutter_study_app/Models/SessionModel.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';

class SearchSession extends StatefulWidget {
  @override
  _SearchSessionState createState() => _SearchSessionState();
}
class _SearchSessionState extends State<SearchSession> {

  SearchSessionBloc _searchSessionBloc;
  List<Session> results = [];
  bool onLoading = false;
  final textController = TextEditingController();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _searchSessionBloc = AppBlocProvider.of(context).searchSessionBloc;
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _searchSessionBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: FloatingSearchBar.builder(
          controller: textController,
          itemCount: results.length,
          itemBuilder: (BuildContext context, int index) {
            if(results.length > 0)
              return getResultCardView(results[0]);
            else 
              return Text("empty");
          },
          trailing: IconButton(
            icon: Icon(Icons.search),
            onPressed: onSearchClicked,
          )
          ),
      ) 
    );
  }
  void onSearchClicked() {
    print("onSearch : ${textController.text}");
    _searchSessionBloc.fetchSessionInfo(textController.text).then((value) {
        print("fetchSessionInfo");
        setState(() {
          results.clear();
          results.add(value[0]);
        });
    }, onError: (error) {
      print("error onSearchClicked - ${error.toString()}");
    });
  }
  Widget getResultCardView(Session session) {
    return Container(
      //padding: EdgeInsets.only(left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
      child: Center(
        child: Card (
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getSubTitle("#${session.name}", 20.0, Colors.purple),
              getLineWidget(),
              Expanded(
                child: ListView.builder(
                  itemCount: session.members.length,
                  itemBuilder: (context, index) {
                    print("index - ${index} + member[index] : ${session.members[index]}");
                    return ListTile(
                      leading: IconButton(icon: Icon(Icons.account_circle),onPressed: (){},),
                      title: Text(session.members[index], style: TextStyle(color: Colors.purple, fontFamily: 'Graphik',fontSize: 15, fontWeight: FontWeight.bold))
                      //title: Text(session.members[index]), 
                    );
                  },
                ),
              )
            ]
          )
        ),
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
                    Colors.purple,
                thickness: 1,
              ),
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      );
  }
}