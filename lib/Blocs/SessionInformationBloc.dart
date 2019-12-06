import 'package:flutter_study_app/Blocs/Bloc.dart';
import 'package:flutter_study_app/Models/FriendListItem.dart';
import 'package:flutter_study_app/Models/NotificationItem.dart';
import 'package:flutter_study_app/Repository/SessionInformationRepository.dart';
import 'package:rxdart/rxdart.dart';

class SessionInformationBloc extends Bloc {
  final _repository = SessionInformationRepository();

  final _friendListFetcher = PublishSubject<FriendListItem>();
  final _notificationFetcher = PublishSubject<NotificationItem>();

  Observable<FriendListItem> get friendList => _friendListFetcher.stream;
  Observable<NotificationItem> get notificationList => _notificationFetcher.stream;

  fetchAllFriendList() async {
    FriendListItem friendListModel = await _repository.fetchAllFriendList();
    _friendListFetcher.sink.add(friendListModel);
  }

  fetchAllNotification() async {
    NotificationItem notificationModel = await _repository.fetchAllNotification();
    _notificationFetcher.sink.add(notificationModel);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _friendListFetcher.close();
    _notificationFetcher.close();
  }

}