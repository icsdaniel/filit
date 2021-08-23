import 'package:filit/src/pages/finalScore.dart';
import 'package:filit/src/pages/sliderPage.dart';
import 'package:flutter/material.dart';
import 'src/pages/homepage.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'filit',
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        StartGame.routeName: (context) => const StartGame(),
        FinalScore.routeName: (context) => const FinalScore(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
