import 'dart:async';

class ScoreManager {
  int _score = 0;
  final _scoreStreamController = StreamController<int>.broadcast();

  Stream<int> get scoreStream => _scoreStreamController.stream;

  void addScore(int score) {
    _score += score;
    _scoreStreamController.add(_score);
    print(_score);
  }

  void dispose() {
    _scoreStreamController.close();
  }
}