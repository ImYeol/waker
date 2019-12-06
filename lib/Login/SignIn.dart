import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kakao_login/flutter_kakao_login.dart';
import 'package:flutter_study_app/Auth/FacebookAuth.dart';
import 'package:flutter_study_app/Auth/KakaoAuth.dart';
import 'package:flutter_study_app/Utils/AuthConfig.dart';
import 'package:flutter_study_app/restapi/KakaoLoginRestapi.dart';
import 'package:flutter_study_app/restapi/FacebookLoginRestapi.dart';

class SignInPage extends StatefulWidget{
  @override
  _SignInPageState createState() => new _SignInPageState();
}

class _SignInPageState extends State<SignInPage>{

  //Kakao Login  
  KakaoAuth mkakaoauth = new KakaoAuth();
  KakaoLoginRestapi mkakaologinrestapi = new KakaoLoginRestapi();

  //Facebook Login 
  FacebookAuth mfacebookauth = new FacebookAuth();
  FacebookLoginRestapi mfacebookloginrestapi = new FacebookLoginRestapi();

  int loginHttpState;

  String accountid;
  String accountemail;
  String accesstoken;


  Widget signInPageState() {
    return new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.05), BlendMode.dstATop),
          image: AssetImage('images/home3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(50.0),
            child: Center(
              child: Icon(
                Icons.import_contacts,
                color: Colors.blue,
                size: 50.0,
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "EMAIL",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.blue,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'gwanjong@gmail.com',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "PASSWORD",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.blue,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    obscureText: true,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '*********',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24.0,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => {},
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.blue,
                    onPressed: () => Navigator.pushNamed(context, '/MainScreen'),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(border: Border.all(width: 0.25)),
                  ),
                ),
                Text(
                  "OR CONNECT WITH",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(border: Border.all(width: 0.25)),
                  ),
                ),
              ],
            ),
          ),

          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(right: 8.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            onPressed: ()=> mfacebookauth.login().then((facebookloginstate) async {
                              switch(facebookloginstate){
                                case AuthConfig.loggedIn:
                                  accountid = mfacebookauth.GetAccountID();
                                  accesstoken = mfacebookauth.GetAccessToken();

                                  loginHttpState = await mfacebookloginrestapi.FacebookLoginPost(accountid, accesstoken);
                                  if(loginHttpState != HttpStatus.ok){
                                    break;
                                  }
                                  Navigator.pushNamed(context, '/MainScreen');
                                  break;
                                case AuthConfig.error:
                                  break;
                                default:
                                  break;
                              }
                            }),
                            padding: EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                            ),
                            
                            child: Image.asset('images/facebook_account_login.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 0.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(right: 8.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            onPressed: ()=> mkakaoauth.login().then((kakaologinstate) async {
                              switch(kakaologinstate){
                                case AuthConfig.loggedIn:
                                  accountid = mkakaoauth.GetAccountID();
                                  accountemail = mkakaoauth.GetAccountEMAIL();
                                  accesstoken = mkakaoauth.GetAccessToken();

                                  loginHttpState = await mkakaologinrestapi.KakaoLoginPost(accountid, accountemail, accesstoken);


                                  if(loginHttpState != HttpStatus.ok){
                                    break;
                                  }

                                  Navigator.pushNamed(context, '/MainScreen');
                                  break;
                                case AuthConfig.error:
                                  break;
                                default:
                                  break;
                              }
                            }),
                            padding: EdgeInsets.only(
                              top: 5.0,
                              bottom: 5.0,
                            ),

                            child: Image.asset('images/kakao_account_login_btn_medium_wide.png'),
                            
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    margin: EdgeInsets.only(right: 8.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            onPressed: ()=> mkakaoauth.login().then((kakaologinstate){
                              switch(kakaologinstate){
                                case AuthConfig.loggedIn:
                                  accountid = mkakaoauth.GetAccountID();
                                  accountemail = mkakaoauth.GetAccountEMAIL();
                                  accesstoken = mkakaoauth.GetAccessToken();

                                  mkakaologinrestapi.KakaoLoginPost(accountid, accountemail,accesstoken);

                                  Navigator.pushNamed(context, '/MainScreen');
                                  break;
                                case AuthConfig.error:
                                  break;
                                default:
                                  print("default");
                                  break;
                              }
                            }),
                            padding: EdgeInsets.only(
                              top: 5.0,
                              bottom: 5.0,
                            ),

                            child: Image.asset('images/kakao_account_login_btn_medium_narrow_EN.png'),
                            
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 20.0,),
          
        ],
      ),
    );
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          signInPageState(),
        ],
      ),
    );
  }

}