import 'dart:async';
import 'dart:io';
import 'package:flutter_study_app/Models/Friend_info_model.dart';
import 'package:flutter_study_app/Models/Search_state.dart';
import 'dart:convert';
import 'package:http/http.dart';

class FriendInfoProvider {

  static final FriendInfoProvider _friendInfoProvider = FriendInfoProvider._private();
  FriendInfoProvider._private();
  factory FriendInfoProvider() => _friendInfoProvider;
  Client client = Client();

  Future<State> fetchSearchList(String query) async {
    print("entered");
    var uri = Uri.parse("http://10.0.2.2:3000/friends");
    print(uri.port);
    print(uri.host);
    print(uri);

    final response = await client.get(uri);
    //http://http://localhost:3000/friends/page=1&query=$query
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return State<FriendInfoModel>.success(FriendInfoModel.fromJson(json.decode(response.body)));
    } else {
      // If that call was not successful, throw an error.
      throw State<String>.error("no result");
    }
    
  }
}