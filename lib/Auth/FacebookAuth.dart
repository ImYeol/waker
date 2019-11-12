import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_study_app/Utils/AuthConfig.dart';

class FacebookAuth {
  static final FacebookLogin facebookSignIn = FacebookLogin();

  Future<String> login() async {
    final result = await facebookSignIn.logIn(['email']);
    _processLoginResult(result);
    
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print('LoggedIn by the user.\n'
                        '- UserID is ${result.accessToken.userId}\n'
                        '- UserToken is ${result.accessToken.token} ');
        return AuthConfig.loggedIn;
      case FacebookLoginStatus.cancelledByUser:
        print('cancelledByUser');
        return AuthConfig.error;
      case FacebookLoginStatus.error:
        print('error');
        return AuthConfig.error;
    } 

    //defult return error
    return AuthConfig.error;
  }
  void _processLoginResult(FacebookLoginResult result){
    
    print(result);
  }
} 