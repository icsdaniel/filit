import 'package:flutter/material.dart';
import 'otherpage.dart';
import '../widgets/setterWithArrows.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: Text('Open route'),
              onPressed: () {
                Navigator.pushNamed(context, OtherPage.routeName);
              },
            ),
          ),
          Center(child:SetterWithArrows(
            defaultVariable: 2,
            defaultMax: 10,
            defaultMin: 1,
          )),
        ],
      ),
    );
  }
}
