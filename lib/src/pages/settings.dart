import 'package:filit/src/pages/homepage.dart';
import 'package:flutter/material.dart';
import '../widgets/pointsSlider2.dart';
import 'package:provider/provider.dart';
import '../models/slider.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  double _variable = 20;

  void _increaseVariable() {
    setState(() {
      var slider = context.read<SliderModel>();
      _variable=_variable+5;
      slider.blockHeight=_variable;
    });
  }

  void _decreaseVariable() {
    setState(() {
      var slider = context.read<SliderModel>();
      _variable=_variable-5;
      slider.blockHeight=_variable;
    });
  }

  @override
  Widget build(BuildContext context) {
    var slider = context.read<SliderModel>();

    return Scaffold(
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _increaseVariable,
              icon: Icon(Icons.arrow_drop_up),
            ),
            SizedBox(
                child: Text(
                  _variable.toString(),
                  textAlign: TextAlign.center,
                ),
                width: 20),
            IconButton(
              onPressed: _decreaseVariable,
              icon: Icon(Icons.arrow_drop_down),
            ),
            Text(slider.blockHeight.toString()),
          ],
        ),
        Consumer<SliderModel>(
          builder: (context, slider, child) => Row(
            children: [
              // Use SomeExpensiveWidget here, without rebuilding every time.
              if (child != null) child,
              Text("settings page\nslider block:${slider.blockHeight}"),
              BackButton(onPressed: () => Navigator.pushNamed(context, HomePage.routeName)),
              PointsSlider2(random: false,blockHeight: slider.blockHeight),
            ],
          ),
          // Build the expensive widget here.
        ),
      ]),
    );
  }
}
