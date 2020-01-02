import 'package:flutter/widgets.dart';
import 'package:flutter_kakao_login/flutter_kakao_login.dart';
import 'package:flutter_study_app/Utils/AuthConfig.dart';

class KakaoAuth {

  static final FlutterKakaoLogin kakaoSignIn = new FlutterKakaoLogin();
  String _accountID = '';
  String _accountEMAIL = '';

  String _loginMessage = 'Current Not Logined :(';
  String _accessToken = '';
  String _accountInfo = '';
  bool _isLogined = false;
  
  List<Map<String, String>> _litems = [ { "key": "login", "title": "Login", "subtitle": ""},
                                      { "key": "logout", "title": "Logout", "subtitle": ""},
                                      { "key": "unlink", "title": "Unlink", "subtitle": ""},
                                      { "key": "account", "title": "Get AccountInfo", "subtitle": ""},
                                      { "key": "accessToken", "title": "Get AccessToken", "subtitle": ""} ];
  
  Future<String> login() async {
    final KakaoLoginResult result = await KakaoAuth.kakaoSignIn.logIn();
    _processLoginResult(result);
    if (result.account != null && result.status != KakaoLoginStatus.error) {
     final KakaoAccountResult account = result.account;
     _processAccountResult(account);
    }

    switch (result.status) {
      case KakaoLoginStatus.loggedIn:
        await _getAccessToken();
        return AuthConfig.loggedIn;
        break;
      case KakaoLoginStatus.loggedOut:
        print('LoggedOut by the user.');
        return AuthConfig.loggedOut;
      break;
      case KakaoLoginStatus.error:
        print('This is Kakao error message : ${result.errorMessage}');
        return AuthConfig.error;
      break;
    }
  
    //defult return error
    return AuthConfig.error;
  }

  Future<Null> logOut() async {
    final KakaoLoginResult result = await KakaoAuth.kakaoSignIn.logOut();
    _processLoginResult(result);
    _processAccountResult(null);
  }

  Future<Null> unlink() async {
    await kakaoSignIn.unlink();
  }

  Future<Null> _getAccountInfo() async {
    final KakaoLoginResult result = await kakaoSignIn.getUserMe();
    if (result != null && result.status != KakaoLoginStatus.error) {
      final KakaoAccountResult account = result.account;
      _processAccountResult(account);
    }
  }

  Future<Null> _getAccessToken() async {
    final KakaoAccessToken accessToken = await (kakaoSignIn.currentAccessToken);
    if (accessToken != null) {
      final token = accessToken.token;
      _updateAccessToken(token);
    } else {
      _updateAccessToken('');
    }
  }

  void _updateLoginMessage(String message) {
    _loginMessage = message;
  }

  void _updateStateLogin(bool logined) {
    _isLogined = logined;      
    if (!logined) {
      _updateAccessToken('');
      _updateAccountMessage('');
    }
  }

  void _updateAccessToken(String accessToken) {
    _accessToken = accessToken;
  }

  void _updateAccountMessage(String message) {
      _accountInfo = message;
  }

  void _processLoginResult(KakaoLoginResult result) {
    switch (result.status) {
      case KakaoLoginStatus.loggedIn:
        _updateLoginMessage('LoggedIn by the user.');
        _updateStateLogin(true);
        break;
      case KakaoLoginStatus.loggedOut:
        _updateLoginMessage('LoggedOut by the user.');
        _updateStateLogin(false);
        break;
      case KakaoLoginStatus.error:
        _updateLoginMessage('This is Kakao error message : ${result.errorMessage}');
        _updateStateLogin(false);
        break;
    }
  }

  void _processAccountResult(KakaoAccountResult account) {
    debugPrint('account : $account');
    if (account == null) {
      _updateAccountMessage('');
    } else {
      final userID = (account.userID == null) ? 'None' : account.userID;
      final userEmail = (account.userEmail == null) ? 'None' : account.userEmail;
      final userPhoneNumber = (account.userPhoneNumber == null) ? 'None' : account.userPhoneNumber;
      final userDisplayID = (account.userDisplayID == null) ? 'None' : account.userDisplayID;
      final userNickname = (account.userNickname == null) ? 'None' : account.userNickname;
      final userProfileImagePath = (account.userProfileImagePath == null) ? 'None' : account.userProfileImagePath;
      final userThumbnailImagePath = (account.userThumbnailImagePath == null) ? 'None' : account.userThumbnailImagePath;

      _updateAccountMessage('- ID is ${userID}\n'
                            '- Email is ${userEmail}\n'
                            '- PhoneNumber is ${userPhoneNumber}\n'
                            '- DisplayID is ${userDisplayID}\n'
                            '- Nickname is ${userNickname}\n'
                            '- ProfileImagePath is ${userProfileImagePath}\n'
                            '- ThumbnailImagePath is ${userThumbnailImagePath}');

      _updateAccountID(userID);
      _updateAccountEMAIL(userEmail);
      
    }
  }

  void _updateAccountID(String accountid) {
    _accountID = accountid;
  }

   void _updateAccountEMAIL(String accountemail) {
    _accountEMAIL = accountemail;
  }

  String GetAccountID(){
    return _accountID;
  }

  String GetAccountEMAIL(){
    return _accountEMAIL;
  }

  String GetAccessToken(){
    return _accessToken;
  }
  
  void setState(Null Function() res) {}
  

}