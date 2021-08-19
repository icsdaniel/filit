import 'package:filit/src/pages/otherpage.dart';
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
        OtherPage.routeName: (context) => const OtherPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
