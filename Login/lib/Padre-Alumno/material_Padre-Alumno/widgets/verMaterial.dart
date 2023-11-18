import 'package:Login/Padre-Alumno/sources.dart';
import 'package:flutter/material.dart';

import '../../../widgets/sourcesWidgets.dart';

class VerMaterial extends StatelessWidget {
  String curso;
  VerMaterial({super.key, required this.curso});

  @override
  Widget build(BuildContext context) {
    return NewContainer(child: ContainerVerMaterial(curso: curso));
  }
}

class ContainerVerMaterial extends StatefulWidget {
  String curso;
  ContainerVerMaterial({super.key, required this.curso});

  @override
  State<ContainerVerMaterial> createState() => _ContainerVerMaterialState();
}

class _ContainerVerMaterialState extends State<ContainerVerMaterial> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              "Nombre del Profesor",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 30),
        Container(
          child: TablaMateriales(
              sesion: "Sesion", teoria: "Teoría", practica: "Práctica"),
        )
      ],
    );
  }
}
