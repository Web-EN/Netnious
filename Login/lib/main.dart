import 'package:Login/page-1/login.dart';
import 'package:flutter/material.dart';
import 'package:Login/director/profesore.dart';
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
      home: Scaffold(
        body: Scene(),
      ));

      // Use el widget de Profesores para probar el código del panel Director-Profesores (hacer esto si necesitas comprobar algún panel, pero has la referencia en el import de arriba)
      //home: Profesores(),
      //);
  }
}
