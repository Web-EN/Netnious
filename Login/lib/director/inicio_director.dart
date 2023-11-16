import 'package:Login/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fl_chart/fl_chart.dart';

class Director extends StatefulWidget {
  const Director({super.key});

  @override
  SceneState createState() => SceneState();
}

class SceneState extends State<Director> {
  final String _mensajeTextField = '';
  String selectedOption = 'Análisis promedio';
  List<String> options = ['Análisis promedio', 'Rendimiento Académico'];
  String _selectedOption = 'Análisis de Asistencia';

  List<double> asistenciaPorBimestre = [90, 85, 92, 88];
  List<double> notasPromedioPorBimestre = [85, 88, 90, 87];

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
          title: const Text('Notificación'),
          content: Text(message, style: SafeGoogleFont('Roboto', fontSize: 22)),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
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
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 932 * fem,
        decoration: const BoxDecoration(
          color: Color(0xffebebeb),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 24 * fem,
              top: 100 * fem,
              child: Text(
                'Mensajes y anuncios',
                style: SafeGoogleFont(
                  'Roboto',
                  fontSize: 22 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.1725 * ffem / fem,
                  color: const Color(0xff000000),
                ),
              ),
            ),
            Positioned(
                left: 24 * fem,
                top: 132 * fem,
                child: SizedBox(
                    width: 377 * fem,
                    height: 168 * fem,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(
                            5.3 * fem, 1 * fem, 5.3 * fem, 1 * fem),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF7D7CD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: TextField(
                          style: TextStyle(
                            fontSize: 20 * fem,
                          ),
                          maxLines: null,
                          minLines: null,
                          expands: true,
                          controller: _messageController,
                          decoration: const InputDecoration(
                            hintText: 'Escribe algun mensaje...',
                          ),
                        )))),
            Positioned(
                left: 294 * fem,
                top: 325 * fem,
                child: Container(
                  height: 33 * fem,
                  width: 107 * fem,
                  child: ElevatedButton(
                    onPressed: _sendMessage,
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      backgroundColor: const Color(0xFFF7D7CD),
                    ),
                    child: Text('Notificar',
                        style: SafeGoogleFont('Roboto', fontSize: 18 * fem)),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16.0),
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
              left: 24 * fem,
              top: 404 * fem,
              child: Text(
                'Estado General',
                style: SafeGoogleFont(
                  'Roboto',
                  fontSize: 22 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.1725 * ffem / fem,
                  color: const Color(0xff000000),
                ),
              ),
            ),
            Positioned(
              left: 24 * fem,
              top: 132 * fem,
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
                left: 23 * fem,
                top: 436 * fem,
                child: SizedBox(
                  height: 250 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7D7CD),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
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
                          titlesData: FlTitlesData(
                            leftTitles: SideTitles(showTitles: true),
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
                left: 23 * fem,
                top: 436 * fem,
                child: SizedBox(
                  height: 250 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7D7CD),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
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
                          titlesData: FlTitlesData(
                            leftTitles: SideTitles(showTitles: true),
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
                                  y: entry.value,
                                  width: 16 * fem,
                                  colors: [Colors.green],
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
    );
  }
}
