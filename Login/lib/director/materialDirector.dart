import 'package:Login/director/menuDirector.dart';
import 'package:flutter/material.dart';

class MaterialDirector extends StatefulWidget {
  const MaterialDirector({super.key});

  @override
  State<MaterialDirector> createState() => _MaterialDirectorState();
}

class _MaterialDirectorState extends State<MaterialDirector> {
  @override
  Widget build(BuildContext context) {
    return MenuDirector(funcion: ContainerMaterialDirector());
  }
}

class ContainerMaterialDirector extends StatefulWidget {
  const ContainerMaterialDirector({super.key});

  @override
  State<ContainerMaterialDirector> createState() =>
      _ContainerMaterialDirectorState();
}

class _ContainerMaterialDirectorState extends State<ContainerMaterialDirector> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
