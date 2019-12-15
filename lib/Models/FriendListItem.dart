import 'package:flutter_study_app/Utils/ItemUpdateCommand.dart';

class FriendListItem {
    List<Friend> _result = [];
    ItemUpdateCommand _cmd;

    FriendListItem.fromJson(Map<dynamic, dynamic> parsedJson) {
      List<Friend> temp = [];
      for (int i = 0; i < parsedJson['results'].length; i++) {
        print(parsedJson['results'].toString());
        print(parsedJson['results'][i].toString());
        Friend result = Friend(parsedJson['results'][i]);
        temp.add(result);
      }
      _result = temp;
    }

    FriendListItem.setResult(String name, bool isOnline) {
      Friend friend = Friend({'name':name, 'isOnline':isOnline});
      List<Friend> temp = [];
      temp.add(friend);
      _result = temp;
    }

    List<Friend> get results => _result;
    ItemUpdateCommand get cmd => _cmd;
    set cmd(ItemUpdateCommand value) {
      assert(value.index >= 0);
      _cmd = value;
    }
}

class Friend {
    String _name;
    bool _isOnline;

    Friend(result){
      print(result.toString());
      _name = result['name'];
      _isOnline = result['isOnline'];
    }

    String get name => _name;
    bool get isOnline => _isOnline;

    set isOnline(bool value) {
      assert(value == true || value == false);
      _isOnline = value;
    }
}