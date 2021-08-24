import 'package:filit/src/pages/finalScore.dart';
import 'package:filit/src/pages/settings.dart';
import 'package:filit/src/pages/sliderPage.dart';
import 'package:filit/src/pages/toCheckSliderPage.dart';
import 'package:flutter/material.dart';
import 'src/pages/homepage.dart';
import 'package:provider/provider.dart';
import 'src/models/slider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'filit',
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          StartGame.routeName: (context) => const StartGame(),
          FinalScore.routeName: (context) => const FinalScore(),
          SettingsPage.routeName: (context) => const SettingsPage(),
          OtherPage.routeName: (context) => const OtherPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
