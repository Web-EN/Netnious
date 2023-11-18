import 'package:Login/Padre-Alumno/sources.dart';
import 'package:flutter/material.dart';

import '../../../widgets/sourcesWidgets.dart';

class BuscarCursoMateriales extends StatefulWidget {
  const BuscarCursoMateriales({super.key});

  @override
  State<BuscarCursoMateriales> createState() => _BuscarCursoMaterialesState();
}

class _BuscarCursoMaterialesState extends State<BuscarCursoMateriales> {
  String selectedCurso = '';
  @override
  Widget build(BuildContext context) {
    return ContainerBuscarCursoMateriales(
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

class ContainerBuscarCursoMateriales extends StatelessWidget {
  String selectedCurso;
  final Function(String tipo, String seleccion) onSelectionChanged;
  ContainerBuscarCursoMateriales(
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
    return Column(
      children: [
        NewContainer(
          child: SeleccionOpcion(
            nombre: 'Curso',
            list: cursos,
            onSelected: (seleccion) {
              onSelectionChanged('Curso', seleccion);
            },
          ),
        ),
        SizedBox(
          height: 50,
        ),
        VerMaterial(curso: selectedCurso),
      ],
    );
    ;
  }
}
