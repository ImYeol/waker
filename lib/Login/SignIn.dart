import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kakao_login/flutter_kakao_login.dart';
import 'package:flutter_study_app/Auth/FacebookAuth.dart';
import 'package:flutter_study_app/Auth/KakaoAuth.dart';
import 'package:flutter_study_app/Blocs/UiBloc.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';
import 'package:flutter_study_app/Utils/AuthConfig.dart';
import 'package:flutter_study_app/restapi/KakaoLoginRestapi.dart';
import 'package:flutter_study_app/restapi/FacebookLoginRestapi.dart';

class SignInPage extends StatefulWidget{
  @override
  _SignInPageState createState() => new _SignInPageState();
}

class _SignInPageState extends State<SignInPage>{

UiBloc _UiBloc;

@override
  void didChangeDependencies() {
    _UiBloc = AppBlocProvider.of(context).Uibloc;
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _UiBloc.dispose();
    super.dispose();
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

          _UiBloc.icon(50.0, 50.0, Colors.blue),
          
          _UiBloc.leftRowCloum(15, "EMAIL", Colors.blue, 15.0, null),
          _UiBloc.inputRow(context, "jongsoo@gmail.com", 30.0, false),
          Divider(height: 24.0,),

          _UiBloc.leftRowCloum(15, "PASSWORD", Colors.blue, 15.0, null),
          _UiBloc.inputRow(context, "*********", 30.0, true),
          Divider(height: 24.0,),

          _UiBloc.rightRowCloum(context, 20, "Forgot Password?", Colors.blue, 15.0, null),

          _UiBloc.button1(context, "LOGIN", "/MainScreen"),
          
          _UiBloc.line1(context, "OR CONNECT WITH"),
          

          _UiBloc.kakaoLoginButton(context, 20.0),
          _UiBloc.facebookLoginButton(context, 0.0),
          

          

          Divider(height: 20.0,),
          
        ],
      ),
    );
  }

  

}