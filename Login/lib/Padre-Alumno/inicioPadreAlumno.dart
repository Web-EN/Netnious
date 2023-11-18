import 'package:Login/Padre-Alumno/menuPadre-Alumno.dart';
import 'package:flutter/material.dart';

class InicioPadreAlumno extends StatelessWidget {
  const InicioPadreAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuPadreAlumno(funcion: ContainerInicioPadreAlumno());
  }
}

class ContainerInicioPadreAlumno extends StatelessWidget {
  const ContainerInicioPadreAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
