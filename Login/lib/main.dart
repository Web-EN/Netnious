import 'package:Login/Padre-Alumno/sources.dart';
import 'package:flutter/material.dart';

import 'utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromRGBO(247, 215, 205, 1)),
          useMaterial3: true,
        ),
        home: MaterialPadreAlumno());
  }
}
