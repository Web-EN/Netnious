import 'package:Login/profesores/menuProfesores.dart';
import 'package:flutter/material.dart';

class InformeClases extends StatefulWidget {
  const InformeClases({super.key});

  @override
  State<InformeClases> createState() => _InformeClasesState();
}

class _InformeClasesState extends State<InformeClases> {
  @override
  Widget build(BuildContext context) {
    return MenuProfesores(funcion: ContainerInformeClases());
  }
}

class ContainerInformeClases extends StatefulWidget {
  const ContainerInformeClases({super.key});

  @override
  State<ContainerInformeClases> createState() => _ContainerInformeClasesState();
}

class _ContainerInformeClasesState extends State<ContainerInformeClases> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
