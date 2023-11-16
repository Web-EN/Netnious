import 'package:Login/profesores/asignar_Fecha_Evaluaciones/sourcesEvaluations.dart';
import 'package:Login/profesores/asignar_Fecha_Evaluaciones/widgets/agregarEvaluacion.dart';
import 'package:flutter/material.dart';

class BuscarCursoEvaluacion extends StatefulWidget {
  const BuscarCursoEvaluacion({super.key});

  @override
  State<BuscarCursoEvaluacion> createState() => _BuscarCursoEvaluacionState();
}

class _BuscarCursoEvaluacionState extends State<BuscarCursoEvaluacion> {
  String selectedGrado = '';
  String selectedSeccion = '';
  String selectedCurso = '';

  @override
  Widget build(BuildContext context) {
    return ContainerBuscarCursoEvaluacion(
      onSelectionChanged: (String tipo, String seleccion) {
        setState(() {
          if (tipo == 'Grado') {
            selectedGrado = seleccion;
          } else if (tipo == 'Sección') {
            selectedSeccion = seleccion;
          } else if (tipo == 'Curso') {
            selectedCurso = seleccion;
          }
        });
      },
      selectedCurso: selectedCurso,
      selectedGrado: selectedGrado,
      selectedSeccion: selectedSeccion,
    );
  }
}

// ignore: must_be_immutable
class ContainerBuscarCursoEvaluacion extends StatelessWidget {
  String selectedGrado;
  String selectedSeccion;
  String selectedCurso;
  final Function(String tipo, String seleccion) onSelectionChanged;
  ContainerBuscarCursoEvaluacion(
      {required this.onSelectionChanged,
      required this.selectedGrado,
      required this.selectedSeccion,
      required this.selectedCurso});

  @override
  Widget build(BuildContext context) {
    final List grado = [
      'pre Kinder',
      'Kinder',
      '1ero',
      '2do',
      '3ero',
      '4to',
      '5to',
      '6to'
    ];
    final List seccion = ['A', 'B', 'C'];
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
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SeleccionOpcion(
              nombre: 'Grado',
              list: grado,
              onSelected: (seleccion) {
                onSelectionChanged('Grado', seleccion);
              },
            ),
            SeleccionOpcion(
              nombre: 'Sección',
              list: seccion,
              onSelected: (seleccion) {
                onSelectionChanged('Sección', seleccion);
              },
            ),
            SeleccionOpcion(
              nombre: 'Curso',
              list: cursos,
              onSelected: (seleccion) {
                onSelectionChanged('Curso', seleccion);
              },
            ),
          ],
        )),
        SizedBox(
          height: 50,
        ),
        SubTitulo(subTitulo: "Evaluaciones:"),
        AgregarEvaluacion(
            grado: selectedGrado,
            curso: selectedCurso,
            seccion: selectedSeccion)
      ],
    );
  }
}
