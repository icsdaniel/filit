import 'package:filit/src/pages/homepage.dart';
import 'package:flutter/material.dart';
import '../widgets/pointsSlider.dart';
import 'package:provider/provider.dart';
import '../models/slider.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int incDecValue = 5;

  void _increaseVariable() {
    setState(() {
      var slider = context.read<SliderModel>();
      slider.blockHeight = slider.blockHeight + incDecValue;
    });
  }

  void _decreaseVariable() {
    setState(() {
      var slider = context.read<SliderModel>();
      slider.blockHeight = slider.blockHeight - incDecValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    var slider = context.read<SliderModel>();

    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        BackButton(onPressed: () => Navigator.pop(context)),
        Consumer<SliderModel>(
          builder: (context, slider, child) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _increaseVariable,
                icon: Icon(Icons.arrow_drop_up),
              ),
              PointsSlider(random: false, blockHeight: slider.blockHeight),
              IconButton(
                onPressed: _decreaseVariable,
                icon: Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
          // Build the expensive widget here.
        ),
      ]),
    ));
  }
}
