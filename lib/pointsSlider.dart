import 'dart:math';
import 'package:flutter/material.dart';

class PointsSlider extends StatefulWidget {
  const PointsSlider({Key? key}) : super(key: key);

  @override
  _PointsSliderState createState() => _PointsSliderState();
}

class _PointsSliderState extends State<PointsSlider> {
  var rng = new Random();
  double bottomPlacement = 46;
  final double blockHeight = 30;
  final double barHeight = 660;
  final double width = 80;
  int points = 0;
  double value = 75;

  void _refreshBottomPlacement() {
    setState(() {
      //bottomPlacement = rng.nextDouble() * (barHeight - blockHeight);
      //i'm in red zone
      if (value >= bottomPlacement && value < bottomPlacement + blockHeight) {
        points = 5;
      }
      //i'm in orange zone
      else if ((value >= bottomPlacement + blockHeight &&
              value < bottomPlacement + 2 * blockHeight) ||
          (value <= bottomPlacement && value > bottomPlacement - blockHeight)) {
        points = 3;
      }
      //i'm in yellow zone
      else if ((value >= bottomPlacement + 2 * blockHeight &&
              value < bottomPlacement + 3 * blockHeight) ||
          (value <= bottomPlacement - blockHeight &&
              value > bottomPlacement - 2 * blockHeight)) {
        points = 1;
      } else {
        points = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _refreshBottomPlacement();
    //positioning using a relative distance from the top or the bottom
    //we first place the max points block using random positioning in the stack and then build the
    //rest of the point bar working from it.
    return Container(
      color: Colors.black,
      height: barHeight,
      width: width,
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: width, //larghezza
          thumbShape: SliderComponentShape
              .noOverlay, //doesn't show the dot that's draggable
          overlayShape:
              SliderComponentShape.noOverlay, //its shade doesn't show up either
          valueIndicatorShape:
              SliderComponentShape.noOverlay, //no value tag when dragged

          trackShape: RectangularSliderTrackShape(),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: bottomPlacement,
              child: Container(
                child: Text("5", textAlign: TextAlign.center),
                width: width,
                height: blockHeight,
                color: Colors.red,
              ),
            ),
            Positioned(
              bottom: bottomPlacement + blockHeight,
              child: Container(
                child: Text("3", textAlign: TextAlign.center),
                width: width,
                height: blockHeight,
                color: Colors.orange,
              ),
            ),
            Positioned(
              bottom: bottomPlacement - blockHeight,
              child: Container(
                child: Text("3", textAlign: TextAlign.center),
                width: width,
                height: blockHeight,
                color: Colors.orange,
              ),
            ),
            Positioned(
              bottom: bottomPlacement + 2 * blockHeight,
              child: Container(
                child: Text("1", textAlign: TextAlign.center),
                width: width,
                height: blockHeight,
                color: Colors.yellow,
              ),
            ),
            Positioned(
              bottom: bottomPlacement - 2 * blockHeight,
              child: Container(
                child: Text("1", textAlign: TextAlign.center),
                width: width,
                height: blockHeight,
                color: Colors.yellow,
              ),
            ),
            Opacity(
              opacity: 0.6,
              child: RotatedBox(
                quarterTurns: 3, //to rotate the slider
                child: Slider(
                  value: value,
                  min: 0,
                  max: barHeight,
                  divisions: barHeight.toInt(),
                  label: value.round().toString(),
                  onChanged: (value) => setState(() => this.value = value),
                ),
              ),
            ),
            Center(
              child: Text(
                '${value.round()}\n${points}',
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
    );
  }
}
