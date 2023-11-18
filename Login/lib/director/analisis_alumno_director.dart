import 'package:flutter/material.dart';

import 'pruebita.dart';

class Alumnos extends StatefulWidget {
  @override
  _AlumnosState createState() => _AlumnosState();
}

class _AlumnosState extends State<Alumnos> {
  TextEditingController _searchController = TextEditingController();
  List<String> alumnos = [
    'Adrián Muñoz',
    'Agustín Rey',
    'Alberto Fuentes',
    'Alejandro Molina',
    'Alba Vega',
    'Alma Soto',
    'Álvaro Lozano',
    'Ana Martínez',
    'Alicia Campos',
    'Alba Vega',
    'Alexis Roldán',
    'Andrés Prieto',
    'Antonio Herrera',
    'Aurora Vila',
    'Beatriz Aguilar',
    'Bruno Galán',
    'Bryan Delgado',
    'Carlos López',
    'Carmen Vargas',
    'Celia Serra',
    'Cristina Cuesta',
    'Claudia Mesa',
    'Clara Pastor',
    'David Medina',
    'Daniela Montes',
    'Diego Ruiz',
    'Elena Díaz',
    'Eduardo Velasco',
    'Eva Ortega',
    'Erick Morales',
    'Esther Pacheco',
    'Félix Menendez',
    'Felipe Mora',
    'Fernando Guerrero',
    'Francisco Delgado',
    'Gabriel Nieto',
    'Gema Maldonado',
    'Gustavo Blanco',
    'Héctor Peña',
    'Hugo Ochoa',
    'Inés Lozano',
    'Iván Vidal',
    'Isabel Ramírez',
    'Jaime Gallego',
    'Javier Sánchez',
    'Jesús Esteban',
    'Jorge Ortega',
    'José Santos',
    'Julia Tovar',
    'Juan García',
    'Kevin Benitez',
    'Laura Pérez',
    'Leticia Olivares',
    'Lidia Carmona',
    'Lorena Cano',
    'Lucía Morales',
    'Lucía Perea',
    'Luis Fernández',
    'Marta Pascual',
    'Marcos Solano',
    'Marina Herrera',
    'Mario Roca',
    'Miguel González',
    'Miranda Cabezas',
    'Miriam Cruz',
    'Mónica Correa',
    'Natalia Cepeda',
    'Nicolás Rivera',
    'Nuria Cazorla',
    'Olivia Cortés',
    'Oscar Caballero',
    'Pablo Jiménez',
    'Paula Méndez',
    'Pedro Castro',
    'Pilar Ibañez',
    'Raul Serrano',
    'Raúl Cano',
    'Ricardo Reyes',
    'Rocío Soria',
    'Rodrigo Redondo',
    'Rosa Rivas',
    'Rubén Soler',
    'Sandra Fuentes',
    'Sara Bravo',
    'Silvia Moya',
    'Sofía Gómez',
    'Teresa Castro',
    'Vanesa Flores',
    'Verónica Vega',
    'Victoria Ramos',
    'Xavier Mendez',
  ];

  List<String> searchResults = [];

  void updateSearchResults() {
    setState(() {
      searchResults = alumnos
          .where((alumno) => alumno
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
                child: Text('Alumnos: ', style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: containerWidth,
                  height: 400, // Ajusta la altura del contenedor aquí
                  padding: const EdgeInsets.all(20),
                  margin:
                      EdgeInsets.zero, // Ajusta el margen del contenedor aquí
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
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Scrollbar(
                            child: Theme(
                              data: ThemeData(
                                primaryColor:
                                    const Color.fromARGB(255, 0, 0, 0),
                                primaryColorDark:
                                    const Color.fromARGB(255, 0, 0, 0),
                              ),
                              child: ListView.builder(
                                itemCount: searchResults.length > 5
                                    ? 5
                                    : searchResults
                                        .length, // Ajusta la cantidad de elementos que se mostrarán
                                itemBuilder: (context, index) {
                                  if (index < searchResults.length) {
                                    return ListTile(
                                        title: Text(searchResults[index]));
                                  } else {
                                    return SizedBox
                                        .shrink(); // No mostrar ningún elemento si el índice excede el tamaño de la lista
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      endDrawer: Menu(),
    );
  }
}