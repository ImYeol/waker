import 'package:flutter_study_app/Models/FriendListItem.dart';
import 'package:flutter_study_app/Models/NotificationItem.dart';
import 'package:flutter_study_app/Restapi/SessionInformationAPIProvider.dart';

class SessionInformationRepository {
  final _sessionInformationProvider = SessionInformationAPIProvider();

  Future<FriendListItem> fetchAllFriendList() => _sessionInformationProvider.fetchAllFriendList();

  Future<NotificationItem> fetchAllNotification() => _sessionInformationProvider.fetchAllNotification();
}