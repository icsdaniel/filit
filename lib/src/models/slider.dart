import 'package:flutter/foundation.dart';

class SliderModel extends ChangeNotifier {
  double _bottomPlacement = 560;
  double _blockHeight = 20;
  double _barHeight = 660;
  double _width = 80;
  double _toShow = 1.0;

  int incDecValue = 5;
  int MAX_BLOCK_HEIGHT = 50;
  int MIN_BLOCK_HEIGHT = 5;

  void increaseBlock() {
    if (_blockHeight < MAX_BLOCK_HEIGHT) {
      _blockHeight = _blockHeight + incDecValue;
    }
  }

  void decreaseBlock() {
    if (_blockHeight > MIN_BLOCK_HEIGHT) {
      _blockHeight = _blockHeight - incDecValue;
    }
  }

  double get blockHeight {
    return _blockHeight;
  }

  void set blockHeight(double val) {
    _blockHeight = val;
  }

  double get bottomPlacement {
    return _bottomPlacement;
  }

  void set bottomPlacement(double val) {
    _bottomPlacement = val;
  }

  double get barHeight {
    return _barHeight;
  }

  void set barHeight(double val) {
    _barHeight = val;
  }

  double get width {
    return _width;
  }

  void set width(double val) {
    _width = val;
  }

  double get toShow {
    return _toShow;
  }

  void set toShow(double val) {
    _toShow = val;
  }
}
