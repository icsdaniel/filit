import 'package:flutter/material.dart';
import 'pointsBarVerticalWidget.dart';

class SliderVerticalWidget extends StatefulWidget {
  @override
  _SliderVerticalWidgetState createState() => _SliderVerticalWidgetState();
}

class _SliderVerticalWidgetState extends State<SliderVerticalWidget> {
  double value = 75;

  @override
  Widget build(BuildContext context) {
    final double min = 0;
    final double max = 100;
    final double _height = 660;
    final double _width = 80;

    return Container(
      height: _height,
      width: _width,
      child: SliderTheme(
      data: SliderThemeData(
        trackHeight: _width, //larghezza
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
              child: PointsBarVerticalWidget(),
              top: 150
            ),
            Opacity(
              opacity: 0.6,
              child: RotatedBox(
                quarterTurns: 3, //to rotate the slider
                child: Slider(
                  value: value,
                  min: min,
                  max: max,
                  divisions: 100,
                  label: value.round().toString(),
                  onChanged: (value) => setState(() => this.value = value),
                ),
              ),
            ),
            Center(
              child: Text(
                '${value.round()}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
