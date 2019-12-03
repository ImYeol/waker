import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/SessionInformationBloc.dart';

class SessionInformationBlocProvider extends InheritedWidget { // 자식 위젯에서 접근하기 위함
  final SessionInformationBloc _sessionBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  
  // static으로 해서 1번만 초기화하도록 함.
  static SessionInformationBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(SessionInformationBlocProvider) as SessionInformationBlocProvider)._sessionBloc;  

  SessionInformationBlocProvider({Key key , SessionInformationBloc sessionBloc, Widget child })
    : this._sessionBloc = sessionBloc ?? SessionInformationBloc(),
      super(child: child, key: key);
}