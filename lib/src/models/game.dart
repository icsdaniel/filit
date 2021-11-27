import 'package:flutter/foundation.dart';

class GameModel extends ChangeNotifier {
  int _teams = 2;
  int _totalRounds = 5;
  int _currentRound = 1;
  var _points = [0, 0, 0];

  int get teams {
    return _teams;
  }

  void set teams(int val) {
    _teams = val;
  }

  int get currentRound {
    return _currentRound;
  }

  void set currentRound(int val) {
    _currentRound = val;
  }

  void addTeam() {
    this._points.add(0);
  }

  void RemoveTeam() {
    this._points.removeLast();
  }

  void addRound() {
    _totalRounds = _totalRounds + 1;
  }

  void removeRound() {
    _totalRounds = _totalRounds - 1;
  }
}
