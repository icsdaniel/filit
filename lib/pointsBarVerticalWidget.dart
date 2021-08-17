import 'package:flutter/material.dart';

class PointsBarVerticalWidget extends StatelessWidget {
  const PointsBarVerticalWidget({Key? key}) : super(key: key);
  final int _difficulty = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: _difficulty,
              child: WhiteBox(),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: YellowBox(),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: OrangeBox(),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RedBox(),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: OrangeBox(),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: YellowBox(),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: _difficulty,
              child: WhiteBox(),
            )
          ],
        )
    );
  }
}


class RedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
    );
  }
}

class OrangeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
      ),
    );
  }
}

class YellowBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.yellow,
      ),
    );
  }
}

class WhiteBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
    );
  }
}