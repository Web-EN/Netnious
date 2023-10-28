import 'package:flutter/material.dart';

import 'pruebita.dart';

class Archivos extends StatefulWidget {
  @override
  _ArchivosState createState() => _ArchivosState();
}

class _ArchivosState extends State<Archivos> {
  TextEditingController _searchController = TextEditingController();
  List<String> archivos = [
    'documento1.docx',
    'documento2.xlsx',
    'documento3.pdf',
    'documento4.txt',
    'documento5.docx',
    'documento6.xlsx',
    'documento7.pdf',
    'documento8.txt',
  ];

  List<String> searchResults = [];

  void updateSearchResults() {
    setState(() {
      searchResults = archivos
          .where((archivo) => archivo
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
                child: Text('Documentos: ', style: TextStyle(fontSize: 20)),
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
              // ... (código anterior)

              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Text('Publicar documentos: ',
                    style: TextStyle(fontSize: 20)),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // Alineación a la izquierda
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
                                TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            child: Text(
                              'Subir...',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
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
                              itemCount: archivos.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(archivos[index]),
                                );
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
                      'Publicar',
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
