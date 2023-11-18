import 'package:Login/Padre-Alumno/menuPadre-Alumno.dart';
import 'package:flutter/material.dart';

class AsistenciaPadreAlumno extends StatelessWidget {
  const AsistenciaPadreAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuPadreAlumno(funcion: ContainerAsistenciaPadreAlumno());
  }
}

class ContainerAsistenciaPadreAlumno extends StatelessWidget {
  const ContainerAsistenciaPadreAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
