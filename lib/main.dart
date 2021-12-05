import 'package:filippo_party_game/ui/screens/test.dart';
import 'package:flutter/material.dart';

import 'ui/screens/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filipo - Party Game',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 55.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
          subtitle1: TextStyle(fontSize: 18.0, color: Colors.white),
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/test': (context) => TestScreen(),
      },
    );
  }
}
