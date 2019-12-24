import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/Models/SessionModel.dart';
import 'package:http/http.dart';

class SearchSessionRestapi {
  Client client = Client();

  Future<SessionModel> fetchSessionInfo(String query) async {
    print("entered");
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return SessionModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      //throw Exception('Failed to load post');
      print("not response for search list");
      String tempJson = await rootBundle.loadString('datas/Session_info.json');
      return SessionModel.fromJson(json.decode(tempJson));
    }
  }
}