import 'package:Login/Padre-Alumno/sources.dart';
import 'package:Login/widgets/newContainer.dart';
import 'package:flutter/material.dart';

class VerHorario extends StatelessWidget {
  const VerHorario({super.key});

  @override
  Widget build(BuildContext context) {
    return NewContainer(child: ContainerVerHorario());
  }
}

class ContainerVerHorario extends StatelessWidget {
  const ContainerVerHorario({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 2555, 0.5),
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Text(
                "Horario de clases",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 2555, 0.5),
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Text(
                "Aula: 2 B",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          color: Color.fromRGBO(255, 255, 255, 0.5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: <Widget>[
                TablaHorario(
                    hora: "hora",
                    cursoLunes: "Lunes",
                    cursoMartes: "Martes",
                    cursoMiercoles: "Miercoles",
                    cursoJueves: "Jueves",
                    cursoViernes: "Viernes"),
                TablaHorario(
                    hora: "",
                    cursoLunes: "",
                    cursoMartes: "",
                    cursoMiercoles: "",
                    cursoJueves: "",
                    cursoViernes: ""),
                TablaHorario(
                    hora: "",
                    cursoLunes: "",
                    cursoMartes: "",
                    cursoMiercoles: "",
                    cursoJueves: "",
                    cursoViernes: ""),
                TablaHorario(
                    hora: "",
                    cursoLunes: "",
                    cursoMartes: "",
                    cursoMiercoles: "",
                    cursoJueves: "",
                    cursoViernes: ""),
                TablaHorario(
                    hora: "",
                    cursoLunes: "",
                    cursoMartes: "",
                    cursoMiercoles: "",
                    cursoJueves: "",
                    cursoViernes: ""),
                TablaHorario(
                    hora: "",
                    cursoLunes: "",
                    cursoMartes: "",
                    cursoMiercoles: "",
                    cursoJueves: "",
                    cursoViernes: ""),
                TablaHorario(
                    hora: "",
                    cursoLunes: "",
                    cursoMartes: "",
                    cursoMiercoles: "",
                    cursoJueves: "",
                    cursoViernes: ""),
                TablaHorario(
                    hora: "",
                    cursoLunes: "",
                    cursoMartes: "",
                    cursoMiercoles: "",
                    cursoJueves: "",
                    cursoViernes: ""),
                TablaHorario(
                    hora: "",
                    cursoLunes: "",
                    cursoMartes: "",
                    cursoMiercoles: "",
                    cursoJueves: "",
                    cursoViernes: ""),
                // ... tus widgets hijos ...
              ],
            ),
          ),
        )
      ],
    );
  }
}
