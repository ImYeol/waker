class FriendInfoModel {
  int page;
  int totalPages;
  List<_Result> results = [];

  FriendInfoModel({
    this.page,
    this.totalPages,
    this.results
  });

  factory FriendInfoModel.fromJson(Map<String, dynamic> parsedJson) => new FriendInfoModel(
    page : parsedJson['page'],
    totalPages : parsedJson['total_pages'],
    results : new List<_Result>.from(parsedJson['results'].map((x) => _Result.fromJson(x)))
  );
    
}


class _Result {
  String uid;
  bool followed;

  _Result({
    this.uid,
    this.followed
  });

  factory _Result.fromJson(Map<String, dynamic> json) => new _Result(
    uid : json['uid'],
    followed : json['followed'], 
  );
}