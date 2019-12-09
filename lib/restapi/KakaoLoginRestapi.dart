import 'dart:convert';

import 'package:http/http.dart' as http;

class KakaoLoginRestapi{

  Future<int> KakaoLoginPost(String accountid, accountemail, accesstoken) async{
    
    var url = 'http://jsserver.iptime.org:8080/login/kakao';
    var body = jsonEncode({'userid':accountid, 'useremail':accountemail, 'usertoken':accesstoken});
    var response = await http.post(url, body: body);
   
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response.statusCode;
  }
}