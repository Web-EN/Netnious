import 'package:Login/profesores/menuProfesores.dart';
import 'package:flutter/material.dart';

class AnuncioProfesor extends StatelessWidget {
  const AnuncioProfesor({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuProfesores(funcion: ContainerAnuncioProfesor());
  }
}

class ContainerAnuncioProfesor extends StatefulWidget {
  const ContainerAnuncioProfesor({super.key});

  @override
  State<ContainerAnuncioProfesor> createState() =>
      _ContainerAnuncioProfesorState();
}

class _ContainerAnuncioProfesorState extends State<ContainerAnuncioProfesor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
