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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filipo - Home'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                child: const Text(
                  'Filippo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40.0),
                child: const Text(
                  'Das beste Trinkspiel der Welt',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Column(children: <Widget>[
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      _navigateTo('/test');
                    },
                    child: Text('Spielen'),
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
    );
  }

  void _navigateTo(String route) {
    print(route);
    Navigator.pushNamed(context, route);
  }
}