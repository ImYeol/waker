import 'package:flutter_study_app/Blocs/Bloc.dart';
import 'package:flutter_study_app/Models/FriendListItem.dart';
import 'package:flutter_study_app/Models/NotificationItem.dart';
import 'package:flutter_study_app/Repository/SessionInformationRepository.dart';
import 'package:flutter_study_app/Utils/ItemUpdateCommand.dart';
import 'package:rxdart/rxdart.dart';

class SessionInformationBloc extends Bloc {
  final _repository = SessionInformationRepository();

  final _friendListFetcher = PublishSubject<FriendListItem>();
  final _notificationFetcher = PublishSubject<NotificationItem>();

  Observable<FriendListItem> get friendList => _friendListFetcher.stream;
  Observable<NotificationItem> get notificationList => _notificationFetcher.stream;

  fetchAllFriendList() async {
    FriendListItem friendListModel = await _repository.fetchAllFriendList();
    friendListModel.cmd = ItemUpdateCommand.INIT;
    _friendListFetcher.sink.add(friendListModel);
  }

  fetchAllNotification() async {
    NotificationItem notificationModel = await _repository.fetchAllNotification();
    notificationModel.cmd = ItemUpdateCommand.INIT;
    _notificationFetcher.sink.add(notificationModel);
  }

  updateFriendToList(FriendListItem item) {
    item.cmd = ItemUpdateCommand.UPDATE;
    _friendListFetcher.sink.add(item);
  }

  addNotificationToList(NotificationItem item) {
    item.cmd = ItemUpdateCommand.ADD;
    _notificationFetcher.sink.add(item);
  }

  addFriendToServer(FriendListItem item){

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _friendListFetcher.close();
    _notificationFetcher.close();
  }

}