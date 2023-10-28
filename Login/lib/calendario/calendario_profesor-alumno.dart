import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarioProfesorAlumno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendario Escolar"),
        backgroundColor: Color.fromRGBO(235, 235, 235, 1.0),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.png"),

            fit: BoxFit.contain,

            alignment: Alignment
                .bottomCenter, // Ajusta la alineación según tus necesidades
          ),
        ),
        child: Content(),
      ),
    );
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  DateTime today = DateTime.now();

  CalendarFormat calenderFormat = CalendarFormat.month;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Text(
                "Calendario Escolar",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              height: 350,
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 215, 205, 1.0),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(8, 8),
                  ),
                ],
              ),
              child: TableCalendar(
                locale: 'es_ES',
                rowHeight: 43,
                headerStyle: HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                onDaySelected: _onDaySelected,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 215, 205, 1.0),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(8, 8),
                  ),
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        "Eventos del mes de ${DateFormat('MMMM', 'es_ES').format(today)}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                      width: 400,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Evento A",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Evento B",
                        style: TextStyle(fontSize: 18),
                      ),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                      width: 400,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding:
                          EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                      width: 400,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Evento C",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
