import 'package:flutter/material.dart';

import 'sourcesEvaluations.dart';

class AsignarFechaEvaluaciones extends StatelessWidget {
  const AsignarFechaEvaluaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(235, 235, 235, 1),
        title:
            Image(image: AssetImage('assets/page-1/images/INGENIUS_logo2.png')),
        elevation: 0,
      ),
      endDrawer: Drawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/page-1/images/fondo_paginas.png"),
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter)),
        alignment: Alignment.topCenter,
        child: ContainerAsignarFechaEvaluaciones(),
      ),
    );
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
