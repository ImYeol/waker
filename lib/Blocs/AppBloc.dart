import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/LoginUiBloc.dart';
import 'package:flutter_study_app/Blocs/SearchSessionBloc.dart';
import 'package:flutter_study_app/Blocs/SessionInformationBloc.dart';
import 'package:flutter_study_app/Restapi/FCMRestapi.dart';

class AppBloc {
  SessionInformationBloc _sessionBloc;
  SearchSessionBloc _searchSessionBloc;
  FCMRestapi _fcmRestapi;
  LoginUiBloc _loginUiBloc;

  AppBloc(BuildContext context) {
    _sessionBloc = SessionInformationBloc();
    _fcmRestapi = FCMRestapi(this);//FCMRestapi(context);
    _loginUiBloc = LoginUiBloc();
    _searchSessionBloc = SearchSessionBloc();
    //_fcmRestapi = fcmapi;
  }

  SessionInformationBloc get sessionBloc => _sessionBloc;
  FCMRestapi get fcmRestapi => _fcmRestapi;
  LoginUiBloc get loginUibloc => _loginUiBloc;
  SearchSessionBloc get searchSessionBloc => _searchSessionBloc;
}