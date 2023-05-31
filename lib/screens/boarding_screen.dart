import 'package:flutter/material.dart';

class BoardingScreen extends StatelessWidget {
  static const id = "/boarding";
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            "Boarding Screen",
          ),
        ),
      ),
    );
  }
}