import 'package:flutter_study_app/Utils/ItemUpdateCommand.dart';

class NotificationItem {

  List<Noti> _result = [];
  ItemUpdateCommand _cmd;

  NotificationItem.fromJson(Map<dynamic, dynamic> parsedJson) {
    List<Noti> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Noti result = Noti(parsedJson['results'][i]);
      temp.add(result);
    }
    _result = temp;
  }

  List<Noti> get results => _result;
  ItemUpdateCommand get cmd => _cmd;
  set cmd(ItemUpdateCommand value) {
    assert(value.index >= 0);
    _cmd = value;
  }
}

class Noti {
  String _name;
  int _state;
  int _hour;
  int _minute;
  int _month;
  int _day;
  int _year;

  Noti(result){
    _name = result['name'];
    _state = result['state'];
    _hour = result['hour'];
    _minute = result['minute'];
    _month = result['month'];
    _day = result['day'];
    _year = result['year'];
  }

  String get name => _name;
  int get state => _state;
  int get hour => _hour;
  int get minute => _minute;
  int get month => _month;
  int get day => _day;
  int get year => _year;
}