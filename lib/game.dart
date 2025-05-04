import 'dart:math';

class Game {
  static final int MIN_VALUE = 0;
  static final int MAX_VALUE = 100;
  static final int MAX_TOP_SCORES = 5; // Maximum number of top scores to store

  int _targetValue = 0;
  int _points = 0;
  int _score = 0;
  int _rounds = 0;
  List<int> _topScores = []; // List to store top scores

  int get score => _score;
  int get rounds => _rounds;
  int get targetValue => _targetValue;
  int get points => _points;
  List<int> get topScores => List.unmodifiable(_topScores); // Getter for top scores

  Game() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
  }

  void calculatePoints(double sliderValue) {
    int sliderValueInt = sliderValue.round().toInt();
    int difference = (_targetValue - sliderValueInt).abs();
    _points = (MAX_VALUE - difference);
    _score += _points;
    _rounds++;
  }

  void reset() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    _points = 0;
  }

  void restartGame() {
    // Add current score to top scores before resetting
    if (_score > 0) {
      _addToTopScores(_score);
    }
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    _points = 0;
    _score = 0;
    _rounds = 0;
  }

  // Private method to add a score to top scores
  void _addToTopScores(int score) {
    _topScores.add(score);
    _topScores.sort((a, b) => b.compareTo(a)); // Sort in descending order
    if (_topScores.length > MAX_TOP_SCORES) {
      _topScores = _topScores.sublist(0, MAX_TOP_SCORES); // Keep only top 5 scores
    }
  }
}
