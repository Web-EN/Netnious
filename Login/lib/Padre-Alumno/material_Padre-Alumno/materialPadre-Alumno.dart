import 'package:Login/Padre-Alumno/sources.dart';
import 'package:Login/widgets/sourcesWidgets.dart';
import 'package:flutter/material.dart';

class MaterialPadreAlumno extends StatelessWidget {
  const MaterialPadreAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuPadreAlumno(funcion: ContainerMaterialPadreAlumno());
  }
}

class ContainerMaterialPadreAlumno extends StatelessWidget {
  const ContainerMaterialPadreAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          child: Container(
            width: screenSize.width - 60,
            margin: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                SubTitulo(subTitulo: "Materiales por curso"),
                BuscarCursoMateriales(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
