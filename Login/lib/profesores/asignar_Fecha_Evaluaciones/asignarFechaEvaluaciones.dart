import 'package:Login/profesores/menuProfesores.dart';
import 'package:flutter/material.dart';

import 'sourcesEvaluations.dart';

class AsignarFechaEvaluaciones extends StatelessWidget {
  const AsignarFechaEvaluaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuProfesores(funcion: ContainerAsignarFechaEvaluaciones());
  }
}

class ContainerAsignarFechaEvaluaciones extends StatelessWidget {
  const ContainerAsignarFechaEvaluaciones({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: screenSize.width - 60,
            margin: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                SubTitulo(subTitulo: "Fecha de proyecto"),
                BuscarCursoEvaluacion(),
              ],
            ),
          ),
          // Elimina este contenedor si no tiene contenido
        ],
      ),
    );
  }
}
