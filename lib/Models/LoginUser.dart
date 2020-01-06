class LoginUser{

  String _userID;					
  String _userEmail;	 			
	String _userToken;	 		


  void SetInfo(String userid, String useremail, String usertoken){
    _userID = userid;
    _userEmail = useremail;
    _userToken = usertoken; 
  }

  String GetUserID(){
    return _userID;
  }

  String GetUserEmail(){
    return _userEmail;
  }

  String GetUserToken(){
    return _userToken;
  }
}