import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola Mundo Flutter Web',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hola Mundo Flutter Web'),
        ),
        body: Center(
          child: Text(
            'Hola Mundo',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
