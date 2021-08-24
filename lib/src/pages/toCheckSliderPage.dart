import 'package:filit/src/pages/homepage.dart';
import 'package:filit/src/pages/settings.dart';
import 'package:flutter/material.dart';
import '../widgets/pointsSlider2.dart';
import 'package:provider/provider.dart';
import '../models/slider.dart';

class OtherPage extends StatefulWidget {
  static const routeName = '/otherpage';
  const OtherPage({Key? key}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  double _variable = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Consumer<SliderModel>(
          builder: (context, slider, child) => Row(
            children: [
              // Use SomeExpensiveWidget here, without rebuilding every time.
              if (child != null) child,
              Text("block heigth: ${slider.blockHeight}"),
              BackButton(onPressed: () => Navigator.pushNamed(context, HomePage.routeName)),
              PointsSlider2(random: false,blockHeight: slider.blockHeight)
            ],
          ),
          // Build the expensive widget here.
          //child:
        ),
      ]),
    );
  }
}
