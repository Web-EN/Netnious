import 'package:Login/profesores/asignar_Fecha_Proyecto/sources.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AgregarProyecto extends StatelessWidget {
  String grado;
  String seccion;
  String curso;

  AgregarProyecto(
      {required this.grado, required this.curso, required this.seccion});
  @override
  Widget build(BuildContext context) {
    return NewContainer(
        child: ContainAgregarProyecto(
            grado: grado, seccion: seccion, curso: curso));
  }
}

class ContainAgregarProyecto extends StatefulWidget {
  final String grado;
  final String seccion;
  final String curso;

  ContainAgregarProyecto(
      {required this.grado, required this.seccion, required this.curso});

  @override
  State<ContainAgregarProyecto> createState() => _ContainAgregarProyectoState();
}

class _ContainAgregarProyectoState extends State<ContainAgregarProyecto> {
  TextEditingController nombreProyecto = TextEditingController();
  TextEditingController fechaInicio = TextEditingController();
  TextEditingController fechaFinal = TextEditingController();

  Map<String, List<Project>> selectedEvents = {};

  @override
  void dispose() {
    nombreProyecto.dispose();
    fechaInicio.dispose();
    fechaFinal.dispose();
    super.dispose();
  }

  List<Project> _getEventsfromDay(String grado, String seccion, String curso) {
    return selectedEvents["$grado-$seccion-$curso"] ?? [];
  }

  void agregarProyecto() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Agregar Proyecto"),
          scrollable: true,
          content: Container(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: nombreProyecto,
                    decoration: InputDecoration(
                      labelText: "Proyecto",
                      hintText: "Nombre del Proyecto",
                    ),
                  ),
                  TextField(
                    controller: fechaInicio,
                    decoration: InputDecoration(labelText: "Fecha Inicio"),
                  ),
                  TextField(
                    controller: fechaFinal,
                    decoration: InputDecoration(labelText: "Fecha Final"),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (nombreProyecto.text.isNotEmpty &&
                    fechaInicio.text.isNotEmpty &&
                    fechaFinal.text.isNotEmpty) {
                  String key =
                      "${widget.grado}-${widget.seccion}-${widget.curso}";
                  if (selectedEvents[key] != null) {
                    selectedEvents[key]!.add(
                      Project(
                        nombre: nombreProyecto.text,
                        fechaInicio: fechaInicio.text,
                        fechaFinal: fechaFinal.text,
                      ),
                    );
                  } else {
                    selectedEvents[key] = [
                      Project(
                        nombre: nombreProyecto.text,
                        fechaInicio: fechaInicio.text,
                        fechaFinal: fechaFinal.text,
                      ),
                    ];
                  }
                }
                Navigator.pop(context);
                nombreProyecto.clear();
                fechaInicio.clear();
                fechaFinal.clear();
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

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: NewButton(
              title: "Agregar...",
              action: agregarProyecto,
            )),
        Container(
          width: screenSize.width,
          margin: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              CuadroTabla(
                  title: "Titulos",
                  fechaInicial: "F. Inicio",
                  fechaFinal: "F. Final"),
              for (var project in _getEventsfromDay(
                widget.grado,
                widget.seccion,
                widget.curso,
              ))
                CuadroTabla(
                  title: project.nombre,
                  fechaInicial: project.fechaInicio,
                  fechaFinal: project.fechaFinal,
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
