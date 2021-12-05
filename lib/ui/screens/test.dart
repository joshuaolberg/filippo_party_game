import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  TestScreenState createState() {
    return TestScreenState();
  }
}

class TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Screen'),
      ),
    );
  }
}
