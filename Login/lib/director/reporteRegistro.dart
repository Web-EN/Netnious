import 'package:Login/director/menuDirector.dart';
import 'package:flutter/material.dart';

class ReporteRegistro extends StatefulWidget {
  const ReporteRegistro({super.key});

  @override
  State<ReporteRegistro> createState() => _ReporteRegistroState();
}

class _ReporteRegistroState extends State<ReporteRegistro> {
  @override
  Widget build(BuildContext context) {
    return MenuDirector(funcion: ContainerReporteRegistro());
  }
}

class ContainerReporteRegistro extends StatefulWidget {
  const ContainerReporteRegistro({super.key});

  @override
  State<ContainerReporteRegistro> createState() =>
      _ContainerReporteRegistroState();
}

class _ContainerReporteRegistroState extends State<ContainerReporteRegistro> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
