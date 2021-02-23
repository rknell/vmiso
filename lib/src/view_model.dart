import 'package:rxdart/rxdart.dart';

class ViewModel {
  late BehaviorSubject _subject;

  Stream get stream => _subject.stream;

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
