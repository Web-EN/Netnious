import 'package:Login/calendario/event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarioDirector extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Calendario',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/fondo.png"),
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomCenter)),
            child: Content()));
  }
}

class Content extends StatefulWidget {
  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  Map<DateTime, List<Event>> selectedEvents = {};

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  TextEditingController _eventController = TextEditingController();
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

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
                children: [
                  TableCalendar(
                    eventLoader: _getEventsfromDay,
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
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(top: 5, right: 20, bottom: 5),
                    child: FilledButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  scrollable: true,
                                  title: Text("Evento:"),
                                  content: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: TextField(
                                      controller: _eventController,
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_eventController.text.isEmpty) {
                                        } else {
                                          if (selectedEvents[today] != null) {
                                            selectedEvents[today]!.add(
                                              Event(
                                                title: _eventController.text,
                                              ),
                                            );
                                          } else {
                                            selectedEvents[today] = [
                                              Event(
                                                  title: _eventController.text)
                                            ];
                                          }
                                        }

                                        Navigator.pop(context);
                                        _eventController.clear();
                                        setState(() {});
                                        return;
                                      },
                                      child: Text(
                                        "Guardar",
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 1)),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromRGBO(247, 215, 205, 1.0),
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: Text(
                          'Agregar...',
                          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                        )),
                  ),
                ],
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
                      width: 500,
                    ),
                    ..._getEventsfromDay(today).map((Event event) => Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 8, right: 8),
                          width: 400,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            event.title,
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
