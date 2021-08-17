import 'package:flutter/material.dart';

class PointsBarVerticalWidget extends StatelessWidget {
  const PointsBarVerticalWidget({Key? key}) : super(key: key);
  final int _difficulty = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        child: Column(
          children: [
            Container(
              child: YellowBox(),
            ),
            Container(
              child: OrangeBox(),
            ),
            Container(
              child: RedBox(),
            ),
            Container(
              child: OrangeBox(),
            ),
            Container(
              child: YellowBox(),
            ),
          ],
        ));
  }
}

class RedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: 50,
      decoration: BoxDecoration(
        color: Colors.yellow,
      ),
    );
  }
}
