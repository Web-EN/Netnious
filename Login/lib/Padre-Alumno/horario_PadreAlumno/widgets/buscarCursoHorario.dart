import 'package:flutter/material.dart';

import '../../../widgets/sourcesWidgets.dart';

class BuscarCursoHorario extends StatefulWidget {
  const BuscarCursoHorario({super.key});

  @override
  State<BuscarCursoHorario> createState() => _BuscarCursoHorarioState();
}

class _BuscarCursoHorarioState extends State<BuscarCursoHorario> {
  String selectedCurso = '';
  @override
  Widget build(BuildContext context) {
    return ContainerBuscarCursoHorario(
      onSelectionChanged: (String tipo, String seleccion) {
        setState(() {
          if (tipo == 'Grado') {
            selectedCurso = seleccion;
          }
        });
      },
      selectedCurso: selectedCurso,
    );
  }
}

class ContainerBuscarCursoHorario extends StatelessWidget {
  String selectedCurso;
  final Function(String tipo, String seleccion) onSelectionChanged;
  ContainerBuscarCursoHorario(
      {super.key,
      required this.selectedCurso,
      required this.onSelectionChanged});

  @override
  Widget build(BuildContext context) {
    final List cursos = [
      'Aritmética',
      'RM',
      'Álgebra',
      'Geometría',
      'Comunicación Integral',
      'RV',
      'Redacción y Expresión Oral',
      'Arte, Expresión Grafomotric',
      'Personal Social'
    ];
    return NewContainer(
      child: SeleccionOpcion(
        nombre: 'Curso',
        list: cursos,
        onSelected: (seleccion) {
          onSelectionChanged('Curso', seleccion);
        },
      ),
    );
  }
}
