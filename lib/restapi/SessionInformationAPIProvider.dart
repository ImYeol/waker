import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/Models/FriendListItem.dart';
import 'package:flutter_study_app/Models/NotificationItem.dart';
import 'package:http/http.dart';

class SessionInformationAPIProvider {
  Client client = Client();

  Future<FriendListItem> fetchAllFriendList() async {
    print("entered");
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return FriendListItem.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      //throw Exception('Failed to load post');
      print("not response for friend list");
      String tempJson = await rootBundle.loadString('datas/friend_list.json');
      return FriendListItem.fromJson(json.decode(tempJson));
    }
  }

  Future<NotificationItem> fetchAllNotification() async {
    print("fetchAllNotification");
    final response = await client
        .get("http://api.themoviedb.org/3/movie/popular?api_key=");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return NotificationItem.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      print("not response for notification list");
      String tempJson = await rootBundle.loadString('datas/notification_list.json');
      return NotificationItem.fromJson(json.decode(tempJson));
    }
  }
}