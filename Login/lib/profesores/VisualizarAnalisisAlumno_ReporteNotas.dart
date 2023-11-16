import 'package:Login/utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Rendimiento());

class Rendimiento extends StatelessWidget {
  const Rendimiento({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      home:  HomeScreen()
        );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/page-1/images/INGENIUS_logo2.png'),
      ),
      body: Reporte_notas(),
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
class Reporte_notas extends StatefulWidget{
  @override
  _ReporteState createState() => _ReporteState();
}

class  _ReporteState extends State<Reporte_notas>{
    final TextEditingController _searchController = TextEditingController();
  List<String> alumnos = ['Diego', 'David', 'Leonid', 'Mateo', 'Franz'];
  List<String> searchResults = [];
  bool _showContainer = false;
  String _selectedAlumno = '';

  void updateSearchResults() {
    setState(() {
      searchResults = alumnos
          .where((alumno) =>
              alumno.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void mostrarDetallesAlumno(String alumno) {
    setState(() {
      _selectedAlumno = alumno;
      _showContainer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 932*fem,
        decoration: BoxDecoration(
          color: Color(0xffebebeb),
        ),
        child: Stack(
          children:[
        Positioned(
      top: 10 * fem,
      left: 27 * fem,
      child: Text('Alumnos', style: TextStyle(fontSize: 20*fem)),
        ),
      Positioned(
        left: 27*fem,
        top: 55*fem,
        child: Container(
          width: 376*fem,
          height: 252 *fem,
          child: Stack(
        children: [
          Positioned(
            left: 0*fem,
            top: 0*fem,
            child: Container(
        width: 376 * fem,
        height: 252 * fem,
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: const Color(0xFFF7D7CD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10*fem),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4*fem,
              offset:Offset(0,4),
              spreadRadius: 0*fem,
            )
          ],
          
        ),)
          ),
          Positioned(
            left: 14*fem,
            top: 28*fem,
            child: Container(
                    width: 347*fem,
                    height: 35*fem,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20*fem),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 40*fem,
                          height: 40*fem,
                          child: InkWell(
                            onTap: updateSearchResults,
                            child: Icon(
                              Icons.search,
                              size: 30*fem,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            width: 10*fem,
                            height: 30*fem,
                            child: TextField(
                              controller: _searchController,
                              onChanged: (text) {
                                updateSearchResults();
                              },
                              decoration: InputDecoration(
                                hintText: 'Buscar',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          Positioned(
                      left: 14 * fem,
                      top: 81 * fem,
                      child: Container(
                        width: 347 * fem,
                        height: 146 * fem,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20 * fem),
                        ),
                        child: Scrollbar(
                          controller: ScrollController(),
                          child: ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  mostrarDetallesAlumno(searchResults[index]);
                                },
                                child: ListTile(
                                  title: Text(searchResults[index]),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
          
        ]),),
      ),
      if (_showContainer)
  Stack(
  children: [
    // Imagen
    Positioned(
      left: 0 * fem,
      top: 705 * fem,
      child: Align(
        child: SizedBox(
          width: 432 * fem,
          height: 286 * fem,
          child: Image.asset(
            'assets/page-1/images/Vector_4_upscaled.png',
            width: 432 * fem,
            height: 286 * fem,
          ),
        ),
      ),
    ),
    // Contenedor delante de la imagen
    Positioned(
      left: 27 * fem,
      top: 390 * fem, // Ajusta la posición del contenedor
      child: GestureDetector(
        onTap: () {
          setState(() {
            _showContainer = false;
          });
        },
        child: Container(
          width: 376 * fem,
          height: 461 * fem,
          decoration: ShapeDecoration(
            color: Color(0xFFF7D7CD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10 * fem),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4 * fem,
                offset: Offset(0, 4 * fem),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _selectedAlumno,
                  style: TextStyle(fontSize: 24 * fem),
                ),
                // Puedes agregar más información del alumno aquí si lo deseas
              ],
            ),
          ),
        ),
      ),
    ),
  ],
),
            Positioned(
      top: 340 * fem,
      left: 27 * fem,
      child: Text('Reporte de notas', style: TextStyle(fontSize: 20*fem)),
        ),
        
            ]
            
            ),
            
        ),
      )
      )
    );

  }
}