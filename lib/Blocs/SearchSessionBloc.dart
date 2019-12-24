import 'package:flutter_study_app/Blocs/Bloc.dart';
import 'package:flutter_study_app/Models/SessionModel.dart';
import 'package:flutter_study_app/Repository/SearchSessionRepository.dart';
import 'package:rxdart/rxdart.dart';

class SearchSessionBloc extends Bloc {
  final _repository = SearchSessionRepository();

  final _sessionFetcher = PublishSubject<SessionModel>();

  Observable<SessionModel> get sessionInfo => _sessionFetcher.stream;

  Future<List<Session>> fetchSessionInfo(String query) async {
    SessionModel sessionModel = await _repository.fetchSessionInfo(query);
    //_sessionFetcher.sink.add(sessionModel);
    List<Session> sessionList = [];
    sessionList.add(sessionModel.session);
    return sessionList;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _sessionFetcher.close();
  }

}