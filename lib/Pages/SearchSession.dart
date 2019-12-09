import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/SearchSessionBloc.dart';
import 'package:flutter_study_app/Models/SessionModel.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';

class SearchSession extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchSessionState();
}

class _SearchSessionState extends State<SearchSession> {

  SearchSessionBloc _searchSessionBloc;
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
    // TODO: implement build
    return Scaffold (
        backgroundColor: Colors.white54,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: _searchSessionBloc.sessionInfo,
                builder: (context, AsyncSnapshot<SessionModel> snapshot) {
                    print("search list view builder");
                    if(snapshot.hasData) {
                      print("snapshot hasdata");
                      return getFloatingSearchBar(snapshot.data.session);
                    } else if(snapshot.hasError) {
                      print("session snapshot has error");
                      return Text(snapshot.data.toString()); 
                    }
                    //return Center(child: CircularProgressIndicator());
                    Session initSession = Session("No result", ["nothing"]);
                    return getFloatingSearchBar(initSession);
                  },
                )    
            ],
          ),
        )
    );
  }

  Widget getFloatingSearchBar(Session session){
    return FloatingSearchBar.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          //return getResult(session);
          return ListTile(
            leading: Text(index.toString()),
          );
        },
        trailing: CircleAvatar(
          child: Text("RD"),
        ),
        //onChanged: (String value) {},
        onTap: () {
          AppBlocProvider.of(context).searchSessionBloc.fetchSessionInfo();
        },
        decoration: InputDecoration.collapsed(
          hintText: "Search Session",
        ),
      );
  }

  Widget getResult(Session session) {
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
            getSubTitle(session.name, 15.0, Colors.purple),
            Expanded(
              child: ListView.builder(
                itemCount: session.members.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(session.members[index]), 
                    leading: IconButton(icon: Icon(Icons.account_circle), onPressed: (){})
                  );
                },
              ),
            )
          ]
        )
      )
    );
  }

  Widget getSubTitle(String title, double fontSize, Color color) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Text(title,style: TextStyle(color: color, fontFamily: 'Graphik',fontSize: fontSize, fontWeight: FontWeight.bold))
    );
  } 
}