import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clash Royale Assistant',
      home: Scaffold(
        body: Center(
          child: Text('Clash Royale Assistant'),
        ),
      ),
    );
  }
}
