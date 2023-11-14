import 'package:Netnious/director/registro_notas.dart';
import 'package:Netnious/page-1/login.dart';
import 'package:Netnious/utils.dart';
import 'package:flutter/material.dart';
import 'package:Netnious/director/inicio_director.dart';
import 'package:Netnious/profesores/Rendimiento_bimestral.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Rendimiento(),
        ),
      ),
    );
  }
}
