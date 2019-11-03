import 'dart:async';
import 'package:flutter_study_app/Models/Search_state.dart';
import 'package:flutter_study_app/Resources/Friend_info_provider.dart';

class FriendsRepo {
  static final _friendsRepo = FriendsRepo._private();
  FriendsRepo._private();
  final _friendInfoProvider = FriendInfoProvider();

  factory FriendsRepo() => _friendsRepo;

  Future<State> fetchSearchFriends(query) => _friendInfoProvider.fetchSearchList(query);
}