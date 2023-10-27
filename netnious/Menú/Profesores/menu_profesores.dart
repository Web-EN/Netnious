import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 44, 44, 44),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                'Inicio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.folder, color: Colors.white),
              title: Text(
                'Material',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              onTap: () {},
            ),
            CustomExpansionTile(
              icon: Icon(Icons.app_registration, color: Colors.white),
              title: Text(
                'Reportes y Registros',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              children: <Widget>[
                CustomListTile(
                  leadingIcon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Registrar Notas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
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
            CustomExpansionTile(
              icon: Icon(Icons.account_tree, color: Colors.white),
              title: Text(
                'Registro Académico',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              children: <Widget>[
                CustomListTile(
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
            CustomExpansionTile(
              icon: Icon(Icons.person_4_outlined, color: Colors.white),
              title: Text(
                'Visualizar Análisis del Alumno',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              children: <Widget>[
                CustomListTile(
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
              leading: Icon(Icons.exit_to_app, color: Colors.white),
              title: Text(
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
      ),
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final Icon icon;
  final Widget title;
  final List<Widget> children;

  CustomExpansionTile(
      {required this.icon, required this.title, required this.children});

  @override
  // ignore: library_private_types_in_public_api
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

  CustomListTile({required this.leadingIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 66, 66, 66),
      child: ListTile(
        leading: leadingIcon,
        title: title,
        onTap: () {},
      ),
    );
  }
}
