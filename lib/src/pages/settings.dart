import 'package:filit/src/pages/homepage.dart';
import 'package:flutter/material.dart';
import '../widgets/pointsSlider.dart';
import 'package:provider/provider.dart';
import '../models/slider.dart';
import '../models/game.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                onPressed: () => {
                  setState(() {
                    slider.increaseBlock();
                  })
                },
                icon: Icon(Icons.arrow_drop_up),
              ),
              PointsSlider(random: false, blockHeight: slider.blockHeight),
              IconButton(
                onPressed: () => {
                  setState(() {
                    slider.decreaseBlock();
                  })
                },
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
