import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/SearchFriendsBloc.dart';
import 'package:flutter_study_app/Models/Friend_info_model.dart';

class SearchFriendDelegate extends SearchDelegate {

  SearchFriendDelegate() {
    //bloc.init();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }
    
    //Add the search term to the searchBloc. 
    //The Bloc will then handle the searching and add the results to the searchResults stream.
    //This is the equivalent of submitting the search term to whatever search service you are using
    /*InheritedBlocs.of(context)
        .searchBloc
        .searchTerm
        .add(query);
*/
    bloc.init();
    bloc.changeQuery(query);
    print("add query ${query}");
    return Column(
      children: <Widget>[

        Expanded(
          flex: 5,
          child:
          //Build the results based on the searchResults stream in the searchBloc
                StreamBuilder(
                    stream: bloc.searchFriend,
                    builder: (context, AsyncSnapshot<FriendInfoModel> snapshot) {
                      print("builder call : ${snapshot.hasData} : ${snapshot.connectionState} : ${snapshot.hasError}");
                      if(snapshot.hasError){
                        print("${snapshot.error}");
                      }
                      if (!snapshot.hasData) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(child: CircularProgressIndicator()),
                          ],
                        );
                      } else {
                        print("snapshot.hasData");
                        print("size : ${snapshot.data.results.length}");
                        print("uid : ${snapshot.data.results[0].uid}");
                        print("uid : ${snapshot.data.results[1].uid}");
                        return ListView.builder(
                          itemCount: snapshot.data.results.length,
                          itemBuilder: (context, index) {
                            var result = snapshot.data.results[index];
                            print("result : ${result.uid} - ${result.followed}");
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
                                      "images/profile_icon2.png",
                                    ),
                                    radius: 25,
                                  ),
                                  title: Text("${result.uid}"),
                                  trailing: 
                                    result.followed? 
                                    Text(
                                    "followed",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ) : IconButton(
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                        onPressed: (){},
                                      ),
                                ),
                              );
                          },
                        );
                  }
                },
              ),
        )

      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes. 
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
 /*   bloc.changeQuery(query);
    print("writing $query");
    return Column(
      children: <Widget>[
        //Build the results based on the searchResults stream in the searchBloc
        StreamBuilder(
          stream: bloc.searchFriend,
          builder: (context, AsyncSnapshot<FriendInfoModel> snapshot) {
            print("builder call : ${snapshot.hasData} : ${snapshot.connectionState} : ${snapshot.hasError}");
            if(snapshot.hasError){
              print("${snapshot.error}");
            }
            if (!snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.results.length,
                itemBuilder: (context, index) {
                  var result = snapshot.data.results[index];
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
                          "images/profile_icon2.png",
                        ),
                        radius: 25,
                      ),
                      title: Text("jong su"),
                      subtitle: Text("started to study"),
                      trailing: IconButton(
                          icon: Icon(
                            result.followed? Icons.block : Icons.add,
                            color: Colors.black,
                          ),
                          onPressed: (){},
                        ) 
                      ),
                    );
                },
              );
            }
          },
        ),
      ],
    );*/
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({this.uid, this.followed, this.searchDelegate});

  final String uid;
  final bool followed;
  final SearchDelegate searchDelegate;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        searchDelegate.close(context, uid);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(uid),
              Text(
                '$followed',
                style: theme.textTheme.headline.copyWith(fontSize: 72.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InheritedBlocs extends InheritedWidget {
  InheritedBlocs(
      {Key key,
      this.searchBloc,
      this.child})
      : super(key: key, child: child);

  final Widget child;
  final SearchFriendsBloc searchBloc;

  static InheritedBlocs of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(InheritedBlocs)
        as InheritedBlocs);
  }

  @override
  bool updateShouldNotify(InheritedBlocs oldWidget) {
    return true;
  }

}