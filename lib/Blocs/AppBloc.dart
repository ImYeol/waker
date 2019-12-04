import 'package:flutter_study_app/Blocs/SessionInformationBloc.dart';

class AppBloc {
  SessionInformationBloc _sessionBloc;
  
  AppBloc() {
    _sessionBloc = SessionInformationBloc();
  }

  SessionInformationBloc get sessionBloc => _sessionBloc;

}