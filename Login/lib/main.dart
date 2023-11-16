import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 60.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Image.network(
          'https://pbs.twimg.com/media/EVn2XrjUMAEfpMY.jpg',
          width: 400,
          height: 300,
        ),
      ),
    );
  }
}
