import 'package:flutter_kakao_login/flutter_kakao_login.dart';

class KakaoAuth {

  static final FlutterKakaoLogin kakaoSignIn = new FlutterKakaoLogin();
  String _loginMessage = 'Current Not Logined :(';
  String _accessToken = '';
  String _accountInfo = '';
  bool _isLogined = false;

  List<Map<String, String>> _litems = [ { "key": "login", "title": "Login", "subtitle": ""},
                                      { "key": "logout", "title": "Logout", "subtitle": ""},
                                      { "key": "unlink", "title": "Unlink", "subtitle": ""},
                                      { "key": "account", "title": "Get AccountInfo", "subtitle": ""},
                                      { "key": "accessToken", "title": "Get AccessToken", "subtitle": ""} ];
  
  Future<Null> login() async {
    final KakaoLoginResult result = await KakaoAuth.kakaoSignIn.logIn();
    _processLoginResult(result);
    //if (result.account != null && result.status != KakaoLoginStatus.error) {
    //  final KakaoAccountResult account = result.account;
    //  _processAccountResult(account);
    //}
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
      _updateAccessToken('AccessToken is \n' + token);
    } else {
      _updateAccessToken('');
    }
  }

  void _updateLoginMessage(String message) {
    // setState(() {
    //   _loginMessage = message;
    // });
  }

  void _updateStateLogin(bool logined) {
    // setState(() {
    //   _isLogined = logined;      
    // });
    // if (!logined) {
    //   _updateAccessToken('');
    //   _updateAccountMessage('');
    // }
  }

  void _updateAccessToken(String accessToken) {
    // setState(() {
    //   _accessToken = accessToken;
    // });
  }

  void _updateAccountMessage(String message) {
    // setState(() {
    //   _accountInfo = message;
    // });
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
    }
  }

}