import 'package:flutter/material.dart';
import '../model/game.dart';

class ViewModel extends ChangeNotifier {
  final Game _game = Game();

  int get score => _game.score;
  int get rounds => _game.rounds;
  int get targetValue => _game.targetValue;
  int get points => _game.points;
  List<int> get topScores => _game.topScores;

  void calculatePoints(double sliderValue) {
    _game.calculatePoints(sliderValue);
    notifyListeners();
  }

  void reset() {
    _game.reset();
    notifyListeners();
  }

  void restartGame() {
    _game.restartGame();
    notifyListeners();
  }
}