import 'dart:async';
import 'package:flutter_study_app/Models/Friend_info_model.dart';
import 'package:flutter_study_app/Models/Search_state.dart';
import '../resources/FriendsRepo.dart';
import 'package:rxdart/rxdart.dart';

// https://bloclibrary.dev/#/flutterangulargithubsearch
// https://blog.usejournal.com/instant-image-search-using-rxdart-in-flutter-9eedd4b53364
// https://github.com/SAGARSURI/PixelPerfect

class SearchFriendsBloc {
  static FriendsRepo _repository = FriendsRepo();
//  final _friendsFetcher = PublishSubject<FriendInfoModel>();
  //PublishSubject<String> _query;
  StreamController<String> _query;
//  Observable<FriendInfoModel> get allFriend => _friendsFetcher.stream;
  
  /*fetchAllFriends() async {
    FriendInfoModel friendModel = await _repository.fetchAllFriends();
    _friendsFetcher.sink.add(friendModel);
  }*/

  init() {
    _query = StreamController<String>();
  }
  Stream<FriendInfoModel> get searchFriend => _query.stream
 //     .debounceTime(Duration(milliseconds: 300))
      .where((String value) => value.isNotEmpty)
      .distinct()
      .transform(streamTransformer);

  final streamTransformer = StreamTransformer<String, FriendInfoModel>.fromHandlers(
      handleData: (String query, EventSink<FriendInfoModel> sink) async {
        print("fromHandlers");
    State state = await _repository.fetchSearchFriends(query);
    if (state is SuccessState) {
      sink.add(state.value);
    } else {
      sink.addError((state as ErrorState).msg);
    }
  });
  dispose() {
//    _friendsFetcher.close();
    _query.close();
  }

   StreamSink<String> get searchTerm => _query.sink;
   Function(String) get changeQuery => _query.sink.add;
}

final bloc = SearchFriendsBloc();