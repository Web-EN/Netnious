import 'package:flutter/material.dart';

class TablaHorario extends StatelessWidget {
  String hora;
  String cursoLunes;
  String cursoMartes;
  String cursoMiercoles;
  String cursoJueves;
  String cursoViernes;

  TablaHorario(
      {super.key,
      required this.hora,
      required this.cursoLunes,
      required this.cursoMartes,
      required this.cursoMiercoles,
      required this.cursoJueves,
      required this.cursoViernes});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              hora,
              style: TextStyle(fontSize: 18),
            ),
            decoration: BoxDecoration(border: Border.all()),
          ),
          Container(
            alignment: Alignment.center,
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(cursoLunes, style: TextStyle(fontSize: 18)),
            decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide())),
          ),
          Container(
            alignment: Alignment.center,
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(cursoMartes, style: TextStyle(fontSize: 18)),
            decoration: BoxDecoration(border: Border.all()),
          ),
          Container(
            alignment: Alignment.center,
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(cursoMiercoles, style: TextStyle(fontSize: 18)),
            decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide())),
          ),
          Container(
            alignment: Alignment.center,
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(cursoJueves, style: TextStyle(fontSize: 18)),
            decoration: BoxDecoration(border: Border.all()),
          ),
          Container(
            alignment: Alignment.center,
            width: 150,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(cursoViernes, style: TextStyle(fontSize: 18)),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(),
                    right: BorderSide(),
                    top: BorderSide())),
          )
        ],
      ),
    );
  }
}
