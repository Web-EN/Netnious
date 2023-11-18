import 'package:Login/profesores/menuProfesores.dart';
import 'package:flutter/material.dart';

class MaterialProfesor extends StatefulWidget {
  const MaterialProfesor({super.key});

  @override
  State<MaterialProfesor> createState() => _MaterialProfesorState();
}

class _MaterialProfesorState extends State<MaterialProfesor> {
  @override
  Widget build(BuildContext context) {
    return MenuProfesores(funcion: ContainerMaterialProfesor());
  }
}

class ContainerMaterialProfesor extends StatefulWidget {
  const ContainerMaterialProfesor({super.key});

  @override
  State<ContainerMaterialProfesor> createState() =>
      _ContainerMaterialProfesorState();
}

class _ContainerMaterialProfesorState extends State<ContainerMaterialProfesor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
