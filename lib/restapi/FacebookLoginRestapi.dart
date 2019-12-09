import 'dart:convert';

import 'package:http/http.dart' as http;

class FacebookLoginRestapi {

  Future<int> FacebookLoginPost(String accountid, accesstoken) async{

    var url = 'http://jsserver.iptime.org:8080/login/facebook';
    var body = jsonEncode({'userid':accountid, 'useremail':"", 'usertoken':accesstoken});
    var response = await http.post(url, body: body);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response.statusCode;
  }
}