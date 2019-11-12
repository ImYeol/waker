import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginRestapi {
  var url = 'http://jsserver.iptime.org:8080/login';


  Future<int> KakaoLoginGet() async {

    var response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
  
      Map<String, dynamic> jsonresponse = convert.jsonDecode(response.body);
      var userid = jsonresponse['userid'];
      var useremail = jsonresponse['useremail'];
      
      return HttpStatus.ok;
    }

    return HttpStatus.badRequest;
  }

  Future<int> KakaoLoginPost(String id, String email) async {

    var request = {};
    request['userid']=id;
    request['useremail']=email;
    
    var requestjson = convert.jsonEncode(request);
    var response = await http.post(url, body:requestjson);

    if (response.statusCode == HttpStatus.ok){
      
      Map<String, dynamic> responsejson = convert.jsonDecode(response.body);
      log('response.statusCode:${response.statusCode}');
      log('response.body:${response.body}');
      log('responsejson.tostring:${responsejson.toString()}');
      
      return HttpStatus.ok;
    }
    return HttpStatus.badRequest;
  }

  Future<int> FacebookLoginPost(String id, String email) async {

    var request = {};
    request['userid']=id;
    request['useremail']=email;
    
    var requestjson = convert.jsonEncode(request);
    var response = await http.post(url, body:requestjson);

    if (response.statusCode == HttpStatus.ok){
      
      Map<String, dynamic> responsejson = convert.jsonDecode(response.body);
      log('response.statusCode:${response.statusCode}');
      log('response.body:${response.body}');
      log('responsejson.tostring:${responsejson.toString()}');
      
      return HttpStatus.ok;
    }
    return HttpStatus.badRequest;
  }
}