import 'package:Login/Padre-Alumno/sources.dart';
import 'package:flutter/material.dart';

import '../../widgets/sourcesWidgets.dart';

class HorarioPadreAlumno extends StatelessWidget {
  const HorarioPadreAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuPadreAlumno(funcion: ContainerHorarioPadreAlumno());
  }
}

class ContainerHorarioPadreAlumno extends StatelessWidget {
  const ContainerHorarioPadreAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: screenSize.width - 60,
        margin: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            SubTitulo(subTitulo: "Horario"),
            VerHorario(),
            SizedBox(height: 30),
            SubTitulo(subTitulo: "Tareas Pendientes"),
            BuscarCursoHorario(),
            SizedBox(
              height: 30,
            ),
            TareasPendientesHorario(),
          ],
        ),
      ),
    );
  }
}
