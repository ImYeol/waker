import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/SessionInformationBloc.dart';
import 'package:flutter_study_app/Restapi/FCMRestapi.dart';

class AppBloc {
  SessionInformationBloc _sessionBloc;
  FCMRestapi _fcmRestapi;
  
  AppBloc(BuildContext context) {
    _sessionBloc = SessionInformationBloc();
    _fcmRestapi = FCMRestapi(this);//FCMRestapi(context);
    //_fcmRestapi = fcmapi;
  }

  SessionInformationBloc get sessionBloc => _sessionBloc;

  FCMRestapi get fcmRestapi => _fcmRestapi;

}