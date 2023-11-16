// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Reporteyregistros(),
    );
  }
}

class Reporteyregistros extends StatefulWidget {
  const Reporteyregistros({super.key});

  @override
  _RyRState createState() => _RyRState();
}

class _RyRState extends State<Reporteyregistros> {
  final TextEditingController _searchController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: <Widget>[
            Text(
              'NETNIOUS',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 17,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 235, 235, 235),
        toolbarHeight: 60.0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double containerWidth = constraints.maxWidth < 800 ? 400 : 400;
          double textFieldWidth = constraints.maxWidth < 600 ? 200 : 300;
          double iconSize = constraints.maxWidth < 600 ? 20 : 30;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 30, top: 30),
                child:
                    Text('Registro de notas: ', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: containerWidth,
                  height: 250,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 247, 215, 205),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 10),
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
                                  decoration: const InputDecoration(
                                    hintText: 'Buscar',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 10,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Scrollbar(
                          child: ListView.builder(
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(searchResults[index]));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
