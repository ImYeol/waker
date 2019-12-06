class NotificationItem {

  List<Result> _result = [];

  NotificationItem.fromJson(Map<String, dynamic> parsedJson) {
    List<Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Result result = Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _result = temp;
  }

  List<Result> get results => _result;
}

class Result {
  String _name;
  int _state;
  int _hour;
  int _minute;
  int _month;
  int _day;
  int _year;

  Result(result){
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