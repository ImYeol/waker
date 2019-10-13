import 'package:flutter/material.dart';
import 'package:flutter_study_app/Login/Login.dart';
import 'package:flutter_study_app/Login/SignIn.dart';
import 'package:flutter_study_app/Login/SignUp.dart';
import 'package:flutter_study_app/Pages/MainScreen.dart';

final routes = {
  '/': (BuildContext context) => LoginPage(),
  '/Login': (BuildContext context) => LoginPage(),
  // '/Account': (BuildContext context) => AccountPage(),
  '/SignUp': (BuildContext context) => SignUpPage(),
  '/SignIn': (BuildContext context) => SignInPage(),
  '/MainScreen': (BuildContext context) => MainScreen(),
};