import 'package:flutter/material.dart';

import '../sourcesEvaluations.dart';

class AgregarEvaluacion extends StatelessWidget {
  String grado;
  String seccion;
  String curso;
  AgregarEvaluacion(
      {required this.grado, required this.curso, required this.seccion});

  @override
  Widget build(BuildContext context) {
    return NewContainer(
        child: ContainAgregarEvaluacion(
            grado: grado, seccion: seccion, curso: curso));
  }
}

class ContainAgregarEvaluacion extends StatefulWidget {
  final String grado;
  final String seccion;
  final String curso;
  const ContainAgregarEvaluacion(
      {required this.grado, required this.seccion, required this.curso});

  @override
  State<ContainAgregarEvaluacion> createState() =>
      _ContainAgregarEvaluacionState();
}

class _ContainAgregarEvaluacionState extends State<ContainAgregarEvaluacion> {
  TextEditingController nombreEvaluacion = TextEditingController();
  TextEditingController fecha = TextEditingController();

  Map<String, List<Evaluations>> selectedEvents = {};

  @override
  void dispose() {
    nombreEvaluacion.dispose();
    fecha.dispose();
    super.dispose();
  }

  List<Evaluations> _getEventsfromDay(
      String grado, String seccion, String curso) {
    return selectedEvents["$grado-$seccion-$curso"] ?? [];
  }

  void agregarEvaluacion() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Evaluacion"),
          scrollable: true,
          content: Container(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: nombreEvaluacion,
                    decoration: InputDecoration(
                      labelText: "Evaluacion",
                      hintText: "Nombre de la Evaluacion",
                    ),
                  ),
                  TextField(
                    controller: fecha,
                    decoration: InputDecoration(labelText: "Fecha"),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (nombreEvaluacion.text.isNotEmpty && fecha.text.isNotEmpty) {
                  String key =
                      "${widget.grado}-${widget.seccion}-${widget.curso}";
                  if (selectedEvents[key] != null) {
                    selectedEvents[key]!.add(
                      Evaluations(
                        nombre: nombreEvaluacion.text,
                        fecha: fecha.text,
                      ),
                    );
                  } else {
                    selectedEvents[key] = [
                      Evaluations(
                        nombre: nombreEvaluacion.text,
                        fecha: fecha.text,
                      ),
                    ];
                  }
                }
                Navigator.pop(context);
                nombreEvaluacion.clear();
                fecha.clear();
                setState(() {});
                return;
              },
              child: Text("Agregar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: NewButton(
              title: "Agregar...",
              action: agregarEvaluacion,
            )),
        Container(
          width: screenSize.width,
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              CuadroTablaEvaluations(title: "Titulos", fecha: "Fecha"),
              for (var project in _getEventsfromDay(
                widget.grado,
                widget.seccion,
                widget.curso,
              ))
                CuadroTablaEvaluations(
                  title: project.nombre,
                  fecha: project.fecha,
                ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            child: Text(
              "Publicar",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 2,
                shadowColor: Colors.blueGrey,
                backgroundColor: Color.fromRGBO(247, 215, 205, 1)),
          ),
        )
      ],
    );
  }
}
