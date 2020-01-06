import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_study_app/Models/Account.dart' as account;

class StopWatchRestapi{

  Future<int> studyTimeUpdate(int h,int m,int s) async {

    var url = 'http://jsserver.iptime.org:8080/timer/update';
    var body = jsonEncode({
      'userid':account.loginUser.GetUserID(), 
      'useremail':account.loginUser.GetUserEmail(), 
      'usertoken':account.loginUser.GetUserToken(),
      'todaystudytime':h*10000 + m*100 + s,
      });
    var response = await http.post(url, body: body);
   
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response.statusCode;

  }

}