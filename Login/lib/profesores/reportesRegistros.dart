import 'package:Login/profesores/menuProfesores.dart';
import 'package:flutter/material.dart';

class ReporteRegistroProfesor extends StatefulWidget {
  const ReporteRegistroProfesor({super.key});

  @override
  State<ReporteRegistroProfesor> createState() =>
      _ReporteRegistroProfesorState();
}

class _ReporteRegistroProfesorState extends State<ReporteRegistroProfesor> {
  @override
  Widget build(BuildContext context) {
    return MenuProfesores(funcion: ContainerReporteRegistroProfesor());
  }
}

class ContainerReporteRegistroProfesor extends StatefulWidget {
  const ContainerReporteRegistroProfesor({super.key});

  @override
  State<ContainerReporteRegistroProfesor> createState() =>
      _ContainerReporteRegistroProfesorState();
}

class _ContainerReporteRegistroProfesorState
    extends State<ContainerReporteRegistroProfesor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
