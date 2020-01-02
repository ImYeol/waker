class LoginUser{
  String _userID;					
  String _userEmail;	 			
	String _userToken;	 		


  void SetUser(String userid, String useremail, String usertoken){
    _userID = userid;
    _userEmail = useremail;
    _userToken = usertoken; 
  }
}