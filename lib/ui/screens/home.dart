import 'package:filippo_party_game/ui/templates/screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.transparent,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'Filippo',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 40.0),
                  child: Text(
                    'Das beste Trinkspiel der Welt',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Column(children: <Widget>[
                  Container(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        _navigateTo('/players');
                      },
                      child: Text('Spiel starten'),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        _navigateTo('/test');
                      },
                      child: Text('Einstellungen'),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        _navigateTo('/test');
                      },
                      child: Text('Über diese App'),
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(String route) {
    print(route);
    Navigator.pushNamed(context, route);
  }
}
