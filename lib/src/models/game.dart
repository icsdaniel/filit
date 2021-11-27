import 'package:flutter/foundation.dart';

class GameModel extends ChangeNotifier {
  int _totalRounds = 5;
  int _currentRound = 1;
  var _points = [0, 0];

  int MAX_TEAMS = 10;
  int MIN_TEAMS = 2;
  int MAX_ROUND = 10;
  int MIN_ROUND = 2;

  // void printTeam(){
  //   print(_points);
  // }
  
  int get teams {
    return _points.length;
  }

  int get totalRounds {
    return _totalRounds;
  }

  void set totalRounds(int val) {
    _totalRounds = val;
  }

  int get currentRound {
    return _currentRound;
  }

  void set currentRound(int val) {
    _currentRound = val;
  }

  void addTeam() {
    if (_points.length < MAX_TEAMS) {
      this._points.add(0);
    }
  }

  void RemoveTeam() {
    if (_points.length > MIN_TEAMS) {
      this._points.removeLast();
    }
  }

  void addRound() {
    if (_totalRounds < MAX_ROUND) {
      _totalRounds = _totalRounds + 1;
    }
  }

  void removeRound() {
    if (_totalRounds > MIN_ROUND) {
      _totalRounds = _totalRounds - 1;
    }
  }
}
