import 'package:Login/profesores/menuProfesores.dart';
import 'package:flutter/material.dart';

class ReporteNotasProfesor extends StatefulWidget {
  const ReporteNotasProfesor({super.key});

  @override
  State<ReporteNotasProfesor> createState() => _ReporteNotasProfesorState();
}

class _ReporteNotasProfesorState extends State<ReporteNotasProfesor> {
  @override
  Widget build(BuildContext context) {
    return MenuProfesores(funcion: ContainerReporteNotasProfesor());
  }
}

class ContainerReporteNotasProfesor extends StatefulWidget {
  const ContainerReporteNotasProfesor({super.key});

  @override
  State<ContainerReporteNotasProfesor> createState() =>
      _ContainerReporteNotasProfesorState();
}

class _ContainerReporteNotasProfesorState
    extends State<ContainerReporteNotasProfesor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
