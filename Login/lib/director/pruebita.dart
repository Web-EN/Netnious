import 'package:Login/director/profesores/profesore.dart';
import 'package:flutter/material.dart';

import 'alumnos/analisis_alumno_director.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NETNIOUS'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla principal'),
      ),
      endDrawer: const Menu(),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

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
            onTap: () {},
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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text(
              'Profesores',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Profesores()), // Reemplaza 'ProfesoresScreen' con el nombre correcto de tu pantalla en profesores.dart
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text(
              'Alumnos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Alumnos()), // Reemplaza 'ProfesoresScreen' con el nombre correcto de tu pantalla en profesores.dart
              );
            },
          ),
          CustomExpansionTile(
            icon: Icon(Icons.folder_open, color: Colors.white),
            title: Text(
              'Reportes y Registros',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            children: <Widget>[
              CustomListTile(
                leadingIcon: Icon(Icons.check, color: Colors.white),
                title: Text(
                  'Visualizar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.white),
            title: const Text(
              'Visualizar Análisis del Alumno',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            onTap: () {},
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
            onTap: () {},
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

  const CustomListTile(
      {super.key, required this.leadingIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 66, 66, 66),
      child: ListTile(
        leading: leadingIcon,
        title: title,
        onTap: () {},
      ),
    );
  }
}
