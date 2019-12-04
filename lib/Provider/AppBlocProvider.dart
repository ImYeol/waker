import 'package:flutter/material.dart';
import 'package:flutter_study_app/Blocs/AppBloc.dart';

class AppBlocProvider extends InheritedWidget { // 자식 위젯에서 접근하기 위함
  final AppBloc appBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  
  // static으로 해서 1번만 초기화하도록 함.
  static AppBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(AppBlocProvider) as AppBlocProvider).appBloc;

  AppBlocProvider({Key key, this.appBloc, child}) : super(key: key, child: child);
}