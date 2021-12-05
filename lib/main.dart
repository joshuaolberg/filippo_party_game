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
      home: HomeScreen(),
      routes: {
        '/test': (context) => TestScreen(),
      },
    );
  }
}
