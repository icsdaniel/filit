import 'package:flutter/foundation.dart';

class SliderModel extends ChangeNotifier {
  double bottomPlacement = 560;
  double _blockHeight = 20;
  double barHeight = 660;
  double width = 80;
  double toShow = 1.0;

  double get blockHeight => _blockHeight;

  set blockHeight(double blockHeight) {
    _blockHeight = blockHeight;
    notifyListeners();
  }
}