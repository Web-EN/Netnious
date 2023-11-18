import 'package:Login/utils.dart';
import 'package:flutter/material.dart';
import 'package:Login/profesores/asignar_Fecha_Proyecto/sources.dart';
import 'package:Login/profesores/Responsive.dart';
import 'package:Login/Padre-Alumno/menuPadre-Alumno.dart';



class InicioNotasAlumno extends StatelessWidget {
  const InicioNotasAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuPadreAlumno(funcion: Rendimiento());
  }
}

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
      body: NotasAlumno(),
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
class NotasAlumno extends StatefulWidget{
  @override
  _NotasAlumnoState createState() => _NotasAlumnoState();
}

class  _NotasAlumnoState extends State<NotasAlumno>{
  @override
  Widget build(BuildContext context) {
    const double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    String selectedPeriodo = '';
    final List<String> bimestres = [
    'Aritmetica',
    'Algebra',
    'Geometria',
    'Razonamiento Matemático',
  ];
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
      child: Text('Reporte de Notas:', style: TextStyle(fontSize: 20*fem)),
        ),
        Positioned(
          left: 25*fem,
          top: 55*fem,
          child: Container(
              width: 377*fem,
              height: 47*fem,
              padding: EdgeInsets.symmetric(horizontal: 20 *fem),
              decoration: ShapeDecoration(
              color: Color(0xFFF7D7CD),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
              BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
              )
              ],
              ),
              child:ContainerBuscarCursoEvaluacion(
      onSelectionChanged: (String tipo, String seleccion) {
        setState(() {
          if (tipo == 'Periodo') {
            selectedPeriodo = seleccion;
        }});
      },
      selectedPeriodo: selectedPeriodo,
      )
              )
        ),

  Stack(
  children: [
   Positioned(
          left: 26*fem ,
          top:150*fem,
          child: Container(
              width: 376*fem,
              height: 239*fem,
              decoration: ShapeDecoration(
              color: Color(0xFFF7D7CD),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
              BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
              )
              ],
              ),
              )
        ),
        Positioned(
          left: 41*fem,
          top: 190*fem , 
          child: Container(
            width: 345*fem,
            height: 168*fem,
            decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFA5908A)),
            ),
            ),
            child: Table(
              border: TableBorder.all(),
              children: List.generate(
                bimestres.length,
                (index) {
                  return TableRow(
                    children: [
                      TableCell(
                        child:Container(
                          height: 42*fem,
                           alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            bimestres[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16*ffem,
                            ),
                          ),
                        ),
                      ),
                      ),
                      TableCell(
                        child:Container(
                          height: 42*fem,
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            '20', 
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18*ffem,
                            ),
                          )
        ),
        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),),
        
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
    Positioned(
          left:53*fem,
          top: 160*fem,
          child:SizedBox(
            width: 48*fem,
            height: 12.87*fem,
            child: Text(
            'Curso',
            style: TextStyle(
            color: Colors.black,
            fontSize: 18*ffem,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
            height: 0,
            ),
            ),
            )
        ),
        Positioned(
          left:300*fem,
          top: 160*fem,
          child:SizedBox(
            width: 48*fem,
            height: 12.87*fem,
            child: Text(
            'Nota',
            style: TextStyle(
            color: Colors.black,
            fontSize: 18*ffem,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w100,
            height: 0,
            ),
            ),
            )
        ),
  ]
            ),
            
          ],
      )
      ))));
      
  }
}

class ContainerBuscarCursoEvaluacion extends StatelessWidget {
  final Function(String tipo, String seleccion) onSelectionChanged;
  final String selectedPeriodo;
  

  ContainerBuscarCursoEvaluacion({
    required this.onSelectionChanged,
    required this.selectedPeriodo,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> periodo = [
      'Primer Bimestre',
      'Segundo Bimestre',
      'Tercer Bimestre',
      'Cuarto Bimestre'

    ];
    return Column(
      children: [
            Responsive(
              nombre: 'Periodo',
              list: periodo,
              onSelected: (seleccion) {
                onSelectionChanged('Periodo', seleccion);
              },
            ),
          ],
        );
  }
}
  
