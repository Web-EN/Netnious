import 'package:Login/page-1/login.dart';
import 'package:Login/profesores/asignar_Fecha_Evaluaciones/asignarFechaEvaluaciones.dart';
import 'package:Login/profesores/asignar_Fecha_Proyecto/asignarFechaProyecto.dart';
import 'package:Login/profesores/informeClases.dart';
import 'package:Login/profesores/inicioProfesor.dart';
import 'package:Login/profesores/materialProfesor.dart';
import 'package:Login/profesores/registrarAsistencia.dart';
import 'package:Login/profesores/reporteAsistenciaProfesor.dart';
import 'package:Login/profesores/reporteNotasProfesor.dart';
import 'package:Login/profesores/reportesRegistros.dart';
import 'package:flutter/material.dart';

class MenuProfesores extends StatelessWidget {
  final funcion;
  const MenuProfesores({required this.funcion});

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
      endDrawer: Menu(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/page-1/images/fondo_paginas.png"),
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter)),
        alignment: Alignment.topCenter,
        child: funcion,
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});
  void navigateToPage(BuildContext context, Widget page) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 44, 44, 44),
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home,
                color: Color.fromARGB(255, 255, 255, 255)),
            title: const Text(
              'Inicio',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            onTap: () => navigateToPage(context, InicioProfesor()),
          ),
          ListTile(
            leading: const Icon(Icons.archive, color: Colors.white),
            title: const Text(
              'Material',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            onTap: () => navigateToPage(context, MaterialProfesor()),
          ),
          ListTile(
            leading: const Icon(Icons.archive, color: Colors.white),
            title: const Text(
              'Reporte y Registros',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            onTap: () => navigateToPage(context, ReporteRegistroProfesor()),
          ),
          CustomExpansionTile(
            icon: Icon(Icons.library_add_check, color: Colors.white),
            title: Text(
              'Registro Académico',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            children: <Widget>[
              CustomListTile(
                page: AsignarFechaProyecto(),
                leadingIcon: Icon(Icons.check, color: Colors.white),
                title: Text(
                  'Asignar Fecha del Proyecto',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              CustomListTile(
                page: AsignarFechaEvaluaciones(),
                leadingIcon: Icon(Icons.check, color: Colors.white),
                title: Text(
                  'Asignar Fecha de Evaluaciones',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              CustomListTile(
                page: RegistrarAsistenciaProfesor(),
                leadingIcon: Icon(Icons.check, color: Colors.white),
                title: Text(
                  'Registrar Asistencia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          const CustomExpansionTile(
            icon: Icon(Icons.group, color: Colors.white),
            title: Text(
              'Visualizar Análisis del Alumno',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            children: <Widget>[
              CustomListTile(
                page: ReporteNotasProfesor(),
                leadingIcon: Icon(Icons.check, color: Colors.white),
                title: Text(
                  'Ver Reporte de Notas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              CustomListTile(
                page: ReporteAsistenciaProfesor(),
                leadingIcon: Icon(Icons.check, color: Colors.white),
                title: Text(
                  'Ver Reporte de Asistencias',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              CustomListTile(
                page: InformeClases(),
                leadingIcon: Icon(Icons.check, color: Colors.white),
                title: Text(
                  'Ver Informes de Clases',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.white),
            title: const Text(
              'Salir',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            onTap: () => navigateToPage(context, Scene()),
          ),
        ],
      ),
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final Icon icon;
  final Widget title;
  final List<Widget> children;

  const CustomExpansionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: widget.icon,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: widget.title,
              ),
              IconButton(
                icon: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
        ),
        if (_isExpanded)
          Column(
            children: widget.children,
          ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Icon leadingIcon;
  final Widget title;
  final page;

  const CustomListTile(
      {super.key,
      required this.leadingIcon,
      required this.title,
      required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 66, 66, 66),
      child: ListTile(
        leading: leadingIcon,
        title: title,
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.of(context, rootNavigator: true)
              .popUntil((route) => route.isFirst);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
      ),
    );
  }
}
