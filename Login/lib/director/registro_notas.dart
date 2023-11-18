import 'package:flutter/material.dart';

class Profesores extends StatefulWidget {
  @override
  _ProfesoresState createState() => _ProfesoresState();
}

class _ProfesoresState extends State<Profesores> {
  TextEditingController _searchController = TextEditingController();
  List<String> profesores = [
    'Maria Elena',
    'Salinas',
    'Juanito',
    'Chumacero',
  ];

  List<String> searchResults = [];

  void updateSearchResults() {
    setState(() {
      searchResults = profesores
          .where((profesor) => profesor
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void agregarProfesor() {
    String nuevoProfesor = _searchController.text.trim();
    if (nuevoProfesor.isNotEmpty) {
      setState(() {
        profesores.add(nuevoProfesor);
        _searchController.clear(); // Limpiar el TextField después de agregar
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    String selectedPeriodo = '';
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30*fem , top: 30*fem),
            child: Text('Registro de notas:', style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 20*fem),
          Center(
            child: Container(
              width: 400*fem,
              height: 323*fem,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(20*fem),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10*fem),
                  Container(
                    width: double.infinity,
                    height: 40*fem,
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
                  SizedBox(height: 20*fem),
                  Container(
                    width: double.infinity,
                    height: 180*fem,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20*fem),
                    ),
                    child: Scrollbar(
                      child: ListView.builder(
                        itemCount: searchResults.length,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text(searchResults[index]));
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top:782*fem,
                    left: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 432 * fem,
                          height: 286 * fem,
                          child: Image.asset(
                          'assets/page-1/images/Vector_4_upscaled.png',
                          width: 432 * fem,
                          height: 286 * fem,
                        ),
                         )
                      )
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10*fem),
           Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: agregarProfesor, // Llamar a la función agregarProfesor
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 0, 0, 0),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20 * fem),
              ),
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.white),
            ),
          ),
          child: Text('Agregar'),
        ),
                SizedBox(width: 25 * fem),
                ],
              ),
            ],
          );
  }
}