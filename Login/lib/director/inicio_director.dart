import 'package:Login/director/menuDirector.dart';
import 'package:Login/utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Director extends StatefulWidget {
  @override
  SceneState createState() => SceneState();
}

class SceneState extends State<Director> {
  @override
  Widget build(BuildContext context) {
    return MenuDirector(funcion: ContainerInicioDirector());
  }
}

class ContainerInicioDirector extends StatefulWidget {
  const ContainerInicioDirector({super.key});

  @override
  State<ContainerInicioDirector> createState() =>
      _ContainerInicioDirectorState();
}

class _ContainerInicioDirectorState extends State<ContainerInicioDirector> {
  String _mensajeTextField = '';
  String selectedOption = 'Análisis promedio';
  List<String> options = ['Análisis promedio', 'Rendimiento Académico'];
  String _selectedOption = 'Análisis de Asistencia';

  List<double> asistenciaPorBimestre = [31, 25, 44, 37];
  List<double> notasPromedioPorBimestre = [15, 17, 12, 08];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    final message = _messageController.text;
    if (message.isNotEmpty) {
      _showNotification(context, 'Mensaje enviado');
    } else {
      _showNotification(context, 'Completa el mensaje');
    }
  }

  void _showNotification(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notificación'),
          content: Text(message, style: SafeGoogleFont('Roboto', fontSize: 22)),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double screenWidth = MediaQuery.of(context).size.width;
    double fem = screenWidth / baseWidth;
    double ffem = fem * 0.97;
    double containerHeight = 932 * fem;

    return SingleChildScrollView(
      child: Container(
        width: screenWidth,
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: 70,
              color: Colors.blue, // Color de fondo del AppBar
              child: Center(
                child: Text(
                  'QUEMEN FLUTTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: screenWidth,
              height: containerHeight,
              decoration: BoxDecoration(
                color: Color(0xffebebeb),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30 * fem,
                    top: 30 * fem,
                    child: Text(
                      'Mensajes y anuncios',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22 * ffem,
                        fontWeight: FontWeight.bold,
                        height: 1.1725 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24 * fem,
                    top: 75 * fem,
                    child: SizedBox(
                      width: screenWidth * 0.88,
                      height: 168 * fem,
                      child: Container(
                        margin: EdgeInsets.all(5.3 * fem),
                        decoration: BoxDecoration(
                          color: Color(0xFFF7D7CD),
                          borderRadius: BorderRadius.circular(10 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: TextField(
                          style: TextStyle(
                            fontSize: 20 * fem,
                          ),
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          // controller: _messageController, // make sure to define _messageController
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(16.0 * fem),
                            hintText: 'Escribe algún mensaje...',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.68,
                    top: 265 * fem,
                    child: Container(
                      height: 33 * fem,
                      width: screenWidth * 0.25,
                      child: ElevatedButton(
                        onPressed:
                            _sendMessage, // make sure to define _sendMessage function
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          primary: Color(0xFFF7D7CD),
                        ),
                        child: Text('Notificar',
                            style: TextStyle(fontSize: 18 * fem)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0 * fem),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.0 * fem),
                        Text(
                          _mensajeTextField,
                          style: TextStyle(
                            color: _mensajeTextField == 'Mensaje enviado'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30 * fem,
                    top: 350 * fem,
                    child: Text(
                      'Estado General',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22 * ffem,
                        fontWeight: FontWeight.bold,
                        height: 1.1725 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 39 * fem,
                    top: 385 * fem,
                    child: DropdownButton<String>(
                      value: _selectedOption,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                        });
                      },
                      items: ['Análisis de Asistencia', 'Otra Opción']
                          .map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                  ),
                  if (_selectedOption == 'Análisis de Asistencia')
                    Positioned(
                      left: 35 * fem,
                      top: 450 * fem,
                      child: SizedBox(
                        height: 240 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF7D7CD),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: AspectRatio(
                            aspectRatio:
                                1.5, // Controla la relación de aspecto del gráfico
                            child: BarChart(
                              BarChartData(
                                maxY: 50,
                                titlesData: FlTitlesData(
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 35,
                                  ),
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    getTitles: (value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return '1°Bim';
                                        case 1:
                                          return '2°Bim';
                                        case 2:
                                          return '3°Bim';
                                        case 3:
                                          return '4°Bim';
                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                ),
                                barGroups: asistenciaPorBimestre
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return BarChartGroupData(
                                    x: entry.key,
                                    barRods: [
                                      BarChartRodData(
                                        y: entry.value,
                                        width: 16 * fem,
                                        colors: [Colors.blue],
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (_selectedOption == 'Otra Opción')
                    Positioned(
                      left: 35 * fem,
                      top: 450 * fem,
                      child: SizedBox(
                        height: 240 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF7D7CD),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: BarChart(
                              BarChartData(
                                maxY: 20,
                                titlesData: FlTitlesData(
                                  leftTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 35,
                                  ),
                                  bottomTitles: SideTitles(
                                    showTitles: true,
                                    getTitles: (value) {
                                      switch (value.toInt()) {
                                        case 0:
                                          return '1°Bim';
                                        case 1:
                                          return '2°Bim';
                                        case 2:
                                          return '3°Bim';
                                        case 3:
                                          return '4°Bim';
                                        default:
                                          return '';
                                      }
                                    },
                                  ),
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                ),
                                barGroups: notasPromedioPorBimestre
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return BarChartGroupData(
                                    x: entry.key,
                                    barRods: [
                                      BarChartRodData(
                                        y: entry
                                            .value, // Establece un límite máximo de 20 para la nota
                                        width: 16 * fem,
                                        colors: [Colors.green],
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
