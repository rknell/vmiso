import 'package:rxdart/rxdart.dart';

class ViewModel {
  BehaviorSubject _subject;

  Observable get stream => _subject.stream;

  notify() {
    _subject.add(this);
  }

  ViewModel() {
    _subject = BehaviorSubject.seeded(this);
  }

  dispose() {
    _subject.close();
  }
}
