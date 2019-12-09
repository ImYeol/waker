import 'package:flutter_study_app/Blocs/Bloc.dart';
import 'package:flutter_study_app/Models/SessionModel.dart';
import 'package:flutter_study_app/Repository/SearchSessionRepository.dart';
import 'package:rxdart/rxdart.dart';

class SearchSessionBloc extends Bloc {
  final _repository = SearchSessionRepository();

  final _sessionFetcher = PublishSubject<SessionModel>();

  Observable<SessionModel> get sessionInfo => _sessionFetcher.stream;

  fetchSessionInfo() async {
    SessionModel sessionModel = await _repository.fetchSessionInfo();
    _sessionFetcher.sink.add(sessionModel);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _sessionFetcher.close();
  }

}