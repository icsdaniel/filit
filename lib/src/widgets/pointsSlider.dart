import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/settings.dart';

class PointsSlider extends StatefulWidget {
  PointsSlider(
      {Key? key,
      this.blockHeight = 50,
      this.barHeight = 660,
      this.width = 80,
      this.random = true})
      : super(key: key);

  final bool random;
  late final double bottomPlacement = getRandomBottomPlacement();
  final double blockHeight;
  final double barHeight;
  final double width;

  double getRandomBottomPlacement() {
    if (random == false)
      return barHeight / 2 - blockHeight / 2;
    else
      return Random().nextDouble() * (barHeight - blockHeight);
  }

  @override
  _PointsSliderState createState() => _PointsSliderState();
}

class _PointsSliderState extends State<PointsSlider> {
  int _points = 0;
  double _value = 0;
  double _toShow = 0.0;

  void _showScore() {
    setState(() {
      if (_toShow == 1.0) {
        _toShow = 0;
      } else {
        _toShow = 1;
      }
    });
  }

  void _updatePoints() {
    setState(() {
      //i'm in red zone
      if (_value >= widget.bottomPlacement &&
          _value < widget.bottomPlacement + widget.blockHeight) {
        _points = 5;
      }
      //i'm in orange zone
      else if ((_value >= widget.bottomPlacement + widget.blockHeight &&
          _value < widget.bottomPlacement + 2 * widget.blockHeight) ||
          (_value <= widget.bottomPlacement &&
              _value > widget.bottomPlacement - widget.blockHeight)) {
        _points = 3;
      }
      //i'm in yellow zone
      else if ((_value >= widget.bottomPlacement + 2 * widget.blockHeight &&
          _value < widget.bottomPlacement + 3 * widget.blockHeight) ||
          (_value <= widget.bottomPlacement - widget.blockHeight &&
              _value > widget.bottomPlacement - 2 * widget.blockHeight)) {
        _points = 1;
      } else {
        _points = 0;
      }
    });
  }

@override
  Widget build(BuildContext context) {
    _updatePoints();
    //positioning using a relative distance from the top or the bottom
    //we first place the max points block using random positioning in the stack and then build the
    //rest of the point bar working from it.
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Container(
        color: Colors.black,
        height: widget.barHeight,
        width: widget.width,
        child: SliderTheme(
          data: SliderThemeData(
            trackHeight: widget.width, //larghezza
            thumbShape: SliderComponentShape
                .noOverlay, //doesn't show the dot that's draggable
            overlayShape: SliderComponentShape
                .noOverlay, //its shade doesn't show up either
            valueIndicatorShape:
                SliderComponentShape.noOverlay, //no value tag when dragged

            trackShape: RectangularSliderTrackShape(),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: widget.bottomPlacement,
                child: Container(
                  child: Text("5", textAlign: TextAlign.center),
                  width: widget.width,
                  height: widget.blockHeight,
                  color: Colors.red,
                ),
              ),
              Positioned(
                bottom: widget.bottomPlacement + widget.blockHeight,
                child: Container(
                  child: Text("3", textAlign: TextAlign.center),
                  width: widget.width,
                  height: widget.blockHeight,
                  color: Colors.orange,
                ),
              ),
              Positioned(
                bottom: widget.bottomPlacement - widget.blockHeight,
                child: Container(
                  child: Text("3", textAlign: TextAlign.center),
                  width: widget.width,
                  height: widget.blockHeight,
                  color: Colors.orange,
                ),
              ),
              Positioned(
                bottom: widget.bottomPlacement + 2 * widget.blockHeight,
                child: Container(
                  child: Text("1", textAlign: TextAlign.center),
                  width: widget.width,
                  height: widget.blockHeight,
                  color: Colors.yellow,
                ),
              ),
              Positioned(
                bottom: widget.bottomPlacement - 2 * widget.blockHeight,
                child: Container(
                  child: Text("1", textAlign: TextAlign.center),
                  width: widget.width,
                  height: widget.blockHeight,
                  color: Colors.yellow,
                ),
              ),
              /*Opacity(
                  opacity: _toShow,
                  child: Expanded(child: Container(color: Colors.green))),*/
              Opacity(
                opacity: 0.6,
                child: RotatedBox(
                  quarterTurns: 3, //to rotate the slider
                  child: Slider(
                    value: _value,
                    min: 0,
                    max: widget.barHeight,
                    divisions: widget.barHeight.toInt(),
                    label: _value.round().toString(),
                    onChanged: (_value) => setState(() => this._value = _value),
                  ),
                ),
              ),
              Center(
                child: Text(
                  '${_value.round()}\n${_points}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}