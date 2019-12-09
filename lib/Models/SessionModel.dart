import 'package:flutter_study_app/Utils/ItemUpdateCommand.dart';

class SessionModel {
    Session _session;

    SessionModel.fromJson(Map<dynamic, dynamic> parsedJson) {
      String name = parsedJson['name'];
      List<String> members = [];
      for (int i = 0; i < parsedJson['members'].length; i++) {
        print(parsedJson['members'].toString());
        members.add(parsedJson['members'][i]['name']);
      }
      _session = Session(name, members);
    }

    Session get session => _session;
}

class Session {
    String _name;
    List<String> _members;

    Session(String name, List<String> members){
      _name = name;
      _members = members;
      print("make session : $_name");
    }

    String get name => _name;
    List<String> get members => _members;
}