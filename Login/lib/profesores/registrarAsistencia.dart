import 'package:Login/profesores/menuProfesores.dart';
import 'package:flutter/material.dart';

class RegistrarAsistenciaProfesor extends StatefulWidget {
  const RegistrarAsistenciaProfesor({super.key});

  @override
  State<RegistrarAsistenciaProfesor> createState() =>
      _RegistrarAsistenciaProfesorState();
}

class _RegistrarAsistenciaProfesorState
    extends State<RegistrarAsistenciaProfesor> {
  @override
  Widget build(BuildContext context) {
    return MenuProfesores(funcion: ContainerRegistrarAsistenciaProfesor());
  }
}

class ContainerRegistrarAsistenciaProfesor extends StatefulWidget {
  const ContainerRegistrarAsistenciaProfesor({super.key});

  @override
  State<ContainerRegistrarAsistenciaProfesor> createState() =>
      _ContainerRegistrarAsistenciaProfesorState();
}

class _ContainerRegistrarAsistenciaProfesorState
    extends State<ContainerRegistrarAsistenciaProfesor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
