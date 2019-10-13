import 'package:flutter/material.dart';
import 'package:flutter_study_app/Login/LoginRoutes.dart';

class LoginMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
    );
  }
}