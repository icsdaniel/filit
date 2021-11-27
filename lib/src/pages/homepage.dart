import 'package:flutter/material.dart';
import 'settings.dart';
import 'package:provider/provider.dart';
import '../models/game.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    var gameData = context.read<GameModel>();
    // gameData.printTeam();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // riga per bottone impostazioni
            Align(
              child: Container(
                alignment: Alignment.topRight,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      SettingsPage.routeName,
                    );
                  },
                  child: const Text('...',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                ),
              ),
            ),
            Align(
              child: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('...',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Card(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: Text(
                          'Squadre',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Ink(
                      height: 28,
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        iconSize: 10,
                        color: Colors.white,
                        icon: const Icon(Icons.remove),
                        onPressed: () => {
                          setState(() {
                            gameData.RemoveTeam();
                          })
                        },
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
                        child: Text(
                          '${gameData.teams}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Ink(
                      height: 28,
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        //
                        iconSize: 15,
                        color: Colors.white,
                        icon: const Icon(Icons.add),
                        onPressed: () => {
                          setState(() {
                            gameData.addTeam();
                          })
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Card(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: Text(
                          'Round',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Ink(
                      height: 28,
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        iconSize: 10,
                        color: Colors.white,
                        icon: const Icon(Icons.remove),
                        onPressed: () => {
                          setState(() {
                            gameData.removeRound();
                          })
                        },
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
                        child: Text(
                          '${gameData.totalRounds}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Ink(
                      height: 28,
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        iconSize: 10,
                        color: Colors.white,
                        icon: const Icon(Icons.add),
                        onPressed: () => {
                          setState(() {
                            gameData.addRound();
                          })
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //bottone play
            Container(
              // color: Colors.amber,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20.0),
              child: MaterialButton(
                height: 70.0,
                minWidth: 150.0,
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () => {},
                child: const Text(
                  'Play!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
