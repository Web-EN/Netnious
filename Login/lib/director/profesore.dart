import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pruebita.dart';

class Profesores extends StatefulWidget {
  @override
  _ProfesoresState createState() => _ProfesoresState();
}

class _ProfesoresState extends State<Profesores> {
  TextEditingController _searchController = TextEditingController();
  List<String> profesores = [];

  List<String> searchResults = [];

    void getProfesores() async { // Acá puse la IP de mi compu, pero debería ser la IP del servidor creo (me arreglaba un eror cuando ponia localhost en vez de la IP), solo no cambiar la parte de /director/profesores
    final response = await http.get(Uri.parse('http://192.168.0.19:3000/director/profesores'));

    //Para verificar que los datos provienen del servidor
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // Para convertir los datos JSON en una lista
    if (response.statusCode == 200) {
      setState(() {
        //profesores = List<String>.from(json.decode(response.body));
        profesores = (json.decode(response.body) as List).map((data) => "${data['Nombres']} ${data['Apellidos']}" as String).toList();
      });
    } else {
      throw Exception('Failed to load profesores');
    }
  }

  // Se hace el llamado a la función getProfesores() cuando se inicia la aplicación
  @override
  void initState() {
    super.initState();
    getProfesores();
  }

  void updateSearchResults() {
    setState(() {
      searchResults = profesores
          .where((profesor) => profesor
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(
              'NETNIOUS',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 17,
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 235, 235, 235),
        toolbarHeight: 60.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double containerWidth = constraints.maxWidth < 800 ? 400 : 400;
          double textFieldWidth = constraints.maxWidth < 600 ? 200 : 300;
          double iconSize = constraints.maxWidth < 600 ? 20 : 30;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text('Profesores: ', style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: containerWidth,
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 215, 205),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: InkWell(
                                onTap: updateSearchResults,
                                child: Icon(
                                  Icons.search,
                                  size: iconSize,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: textFieldWidth,
                                height: 30,
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
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Scrollbar(
                          child: Theme(
                            data: ThemeData(
                              primaryColor: const Color.fromARGB(255, 0, 0, 0),
                              primaryColorDark:
                                  const Color.fromARGB(255, 0, 0, 0),
                            ),
                            child: ListView.builder(
                              itemCount: searchResults.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Text(searchResults[index]));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 247, 215, 205),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    child: Text(
                      'Agregar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                ],
              ),
            ],
          );
        },
      ),
      endDrawer: Menu(),
    );
  }
}

