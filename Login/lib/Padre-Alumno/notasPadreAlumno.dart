import 'package:Login/Padre-Alumno/menuPadre-Alumno.dart';
import 'package:flutter/material.dart';

class NotasPadreAlumno extends StatelessWidget {
  const NotasPadreAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuPadreAlumno(funcion: ContainerNotasPadreAlumno());
  }
}

class ContainerNotasPadreAlumno extends StatefulWidget {
  const ContainerNotasPadreAlumno({super.key});

  @override
  State<ContainerNotasPadreAlumno> createState() =>
      _ContainerNotasPadreAlumnoState();
}

class _ContainerNotasPadreAlumnoState extends State<ContainerNotasPadreAlumno> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
