import 'package:flutter_study_app/Blocs/LoginUiBloc.dart';
import 'package:flutter_study_app/Blocs/SessionInformationBloc.dart';

class AppBloc {
  SessionInformationBloc _sessionBloc;
  LoginUiBloc _loginUiBloc;

  AppBloc() {
    _sessionBloc = SessionInformationBloc();
    _loginUiBloc = LoginUiBloc();
  }

  SessionInformationBloc get sessionBloc => _sessionBloc;
  LoginUiBloc get loginUibloc => _loginUiBloc;
}