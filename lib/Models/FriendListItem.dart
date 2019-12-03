class FriendListItem {
    List<Result> _result = [];

    FriendListItem.fromJson(Map<String, dynamic> parsedJson) {
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
    bool _isOnline;

    Result(result){
      _name = result['name'];
      _isOnline = result['isOnline'];
    }

    String get name => _name;
    bool get isOnline => _isOnline;
}