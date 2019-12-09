import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/Auth/FacebookAuth.dart';
import 'package:flutter_study_app/Auth/KakaoAuth.dart';
import 'package:flutter_study_app/Utils/AuthConfig.dart';
import 'package:flutter_study_app/restapi/FacebookLoginRestapi.dart';
import 'package:flutter_study_app/restapi/KakaoLoginRestapi.dart';

class LoginUiBloc{

  Container icon(double edge, double iconSize, Color color){
    return Container(
            padding: EdgeInsets.only(top:edge),
            child: Center(
              child: Icon(Icons.import_contacts, color: color, size: iconSize,),
            ),
          );
  }

  Container projectName(double edge, double fontSize){
    return Container(
            padding: EdgeInsets.only(top: edge),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "GwanJong",
                  style: TextStyle(color: Colors.white, fontSize: fontSize, fontFamily: 'Mansalva'),
                ),
                Text(
                  "Project",
                  style: TextStyle(color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold, fontFamily: 'Mansalva'),
                )
              ],
            ),
          );
  }

  // Container showButton(BuildContext context, String word){
  //   return new Container(
  //           width: MediaQuery.of(context).size.width,
  //           margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 100.0),
  //           alignment: Alignment.center,
  //           child: new Row(
  //             children: <Widget>[
  //               Expanded(
  //                 child: new OutlineButton(
  //                   shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  //                   color: Colors.red,
  //                   highlightedBorderColor: Colors.white,
  //                   onPressed: () => gotoSignup(context),
  //                   child: new Container(
  //                     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0,),
  //                     child: new Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: <Widget>[
  //                         new Expanded(
  //                           child: Text(
  //                             word,
  //                             textAlign: TextAlign.center,
  //                             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Futura'),
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  // }

  Container button1(BuildContext context, String word, String navi){
    return new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
                    color: Colors.blue,
                    onPressed: () => goto(context, navi),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              word,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Futura'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  Container line1(BuildContext context, String word){
    return Container(
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
                  word,
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
          );
  }

  Container facebookLoginButton(BuildContext context, double topEdge){

    FacebookAuth mfacebookauth = new FacebookAuth();
    FacebookLoginRestapi mfacebookloginrestapi = new FacebookLoginRestapi();
    
    String accountid;
    String accountemail;
    String accesstoken;
    
    int loginHttpState;

    return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 30.0, right: 30.0, top: topEdge),
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
          );
  }

  Container kakaoLoginButton(BuildContext context, double topEdge){

    KakaoAuth mkakaoauth = new KakaoAuth();
    KakaoLoginRestapi mkakaologinrestapi = new KakaoLoginRestapi();
    
    String accountid;
    String accountemail;
    String accesstoken;
    
    int loginHttpState;
    
    return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 30.0, right: 30.0, top: topEdge),
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
          );
  }
  Row rowCloum(double edge, String word){
    return Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: new Text(
                    word,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          );
  }

  Row rightRowCloum(BuildContext context, double edge, String word, Color color, double fontSize, String navi){
    return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: edge),
                child: FlatButton(
                  child: Text(
                    word,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: fontSize
                    ),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () => goto(context, navi),
                ),
              ),
            ],
          );
  }

  Row leftRowCloum(double edge, String word, Color color, double fontSize, Function onpressed){
    return Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: FlatButton(
                  child: Text(
                    word,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: fontSize
                    ),
                    textAlign: TextAlign.start,
                  ),
                  onPressed: () => onpressed,
                ),
              ),
            ],
          );
  }
  
  Container inputRow(BuildContext context, String hint, double leftEdge, bool obscuretext){
    return new Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: leftEdge, right: 40.0, top: 10.0),
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
                    obscureText: obscuretext,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  goto(BuildContext context, String navi){
    Navigator.pushNamed(context, navi);
  } 


  @override
  void dispose() {
    // TODO: implement dispose
  
  }

}