import 'package:Login/profesores/asignar_Fecha_Proyecto/sources.dart';
import 'package:Login/profesores/menuProfesores.dart';
import 'package:flutter/material.dart';

class AsignarFechaProyecto extends StatelessWidget {
  const AsignarFechaProyecto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuProfesores(funcion: ContainerAsignarFechaProyecto());
  }
}

class ContainerAsignarFechaProyecto extends StatelessWidget {
  const ContainerAsignarFechaProyecto({Key? key}) : super(key: key);

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
                BuscarCursoProyecto(),
              ],
            ),
          ),
          // Elimina este contenedor si no tiene contenido
        ],
      ),
    );
  }
}
