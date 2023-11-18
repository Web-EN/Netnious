import 'package:Login/profesores/menuProfesores.dart';
import 'package:flutter/material.dart';

class InicioProfesor extends StatelessWidget {
  const InicioProfesor({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuProfesores(funcion: ContainerInicioProfesor());
  }
}

class ContainerInicioProfesor extends StatefulWidget {
  const ContainerInicioProfesor({super.key});

  @override
  State<ContainerInicioProfesor> createState() =>
      _ContainerInicioProfesorState();
}

class _ContainerInicioProfesorState extends State<ContainerInicioProfesor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
