import 'package:flutter/material.dart';

class ScreenTemplate extends StatelessWidget {
  ScreenTemplate({
    required this.child,
  });

  final Widget child;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.4, 0.9],
            colors: [
              Color(0xFF141E30),
              Color(0xFF243B55),
            ],
          ),
        ),
        child: Stack(
          children: [
            child,
          ],
        ),
      ),
    );
  }
}
