import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FacebookAuth {
  static final FacebookLogin facebookSignIn = FacebookLogin();
  
  Future<Null> login() async {
    final result = await facebookSignIn.logIn(['email']);
    _processLoginResult(result);
  }
  void _processLoginResult(FacebookLoginResult result){
    print(result);
  }
}