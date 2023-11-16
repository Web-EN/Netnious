import 'package:flutter/material.dart';
import 'profesores/pruebita.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: <Widget>[
            Text(
              'NETNIOUS',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 17,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: 60.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Image.network(
          'https://pbs.twimg.com/media/EVn2XrjUMAEfpMY.jpg',
          width: 400,
          height: 300,
        ),
      ),
      endDrawer: const Menu(),
    );
  }
}
