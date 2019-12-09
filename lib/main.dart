import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/Blocs/AppBloc.dart';
import 'package:flutter_study_app/Login/LoginMainPage.dart';
import 'package:flutter_study_app/Provider/AppBlocProvider.dart';
import 'package:flutter_study_app/Utils/Const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool isDark = false;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark ? Constants.darkPrimary : Constants.lightPrimary,
      statusBarIconBrightness: isDark?Brightness.light:Brightness.dark,
    ));
    return AppBlocProvider(
      appBloc: AppBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        theme: isDark ? Constants.darkTheme : Constants.lightTheme,
        // home: MainScreen(),
        home: LoginMainPage(),
      )
    );
  }

}