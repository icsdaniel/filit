import 'package:filit/src/pages/settings.dart';
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
          SettingsPage.routeName: (context) => const SettingsPage()
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
