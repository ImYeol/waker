import 'package:flutter_study_app/Blocs/UiBloc.dart';
import 'package:flutter_study_app/Blocs/SessionInformationBloc.dart';

class AppBloc {
  SessionInformationBloc _sessionBloc;
  UiBloc _UiBloc;

  AppBloc() {
    _sessionBloc = SessionInformationBloc();
    _UiBloc = UiBloc();
  }

  SessionInformationBloc get sessionBloc => _sessionBloc;
  UiBloc get Uibloc => _UiBloc;
}