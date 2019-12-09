import 'package:flutter_study_app/Models/SessionModel.dart';
import 'package:flutter_study_app/Restapi/SearchSessionRestapi.dart';

class SearchSessionRepository {
  final _searchSessionResapi = SearchSessionRestapi();

  Future<SessionModel> fetchSessionInfo() => _searchSessionResapi.fetchSessionInfo();

}