import 'package:Login/profesores/menuProfesores.dart';
import 'package:flutter/material.dart';

class ReporteAsistenciaProfesor extends StatefulWidget {
  const ReporteAsistenciaProfesor({super.key});

  @override
  State<ReporteAsistenciaProfesor> createState() =>
      _ReporteAsistenciaProfesorState();
}

class _ReporteAsistenciaProfesorState extends State<ReporteAsistenciaProfesor> {
  @override
  Widget build(BuildContext context) {
    return MenuProfesores(funcion: ContainerReporteAsistenciaProfesor());
  }
}

class ContainerReporteAsistenciaProfesor extends StatefulWidget {
  const ContainerReporteAsistenciaProfesor({super.key});

  @override
  State<ContainerReporteAsistenciaProfesor> createState() =>
      _ContainerReporteAsistenciaProfesorState();
}

class _ContainerReporteAsistenciaProfesorState
    extends State<ContainerReporteAsistenciaProfesor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
