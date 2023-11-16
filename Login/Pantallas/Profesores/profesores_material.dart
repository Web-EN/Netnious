import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfesoresMaterial(),
    );
  }
}

class ProfesoresMaterial extends StatefulWidget {
  const ProfesoresMaterial({super.key});

  @override
  ProfesoresMaterialState createState() => ProfesoresMaterialState();
}

class ProfesoresMaterialState extends State<ProfesoresMaterial> {
  List<String> material = [
    'Material 1',
    'Material 2',
    'Material 3',
    'Material 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NETNIOUS'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 172,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 215, 205),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 15),
                  buildDropdownRow('GRADOS'),
                  const SizedBox(height: 15),
                  buildDropdownRow('SECCIÓN'),
                  const SizedBox(height: 15),
                  buildDropdownRow('CURSO'),
                ],
              ),
            ),
            const SizedBox(height: 36),
            Container(
              height: 305,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 215, 205),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 15),
                  buildDropdownRow('UNIDAD'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Subir ...',
                            style: TextStyle(
                              color: Color.fromARGB(255, 77, 76, 76),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 350,
                    height: 155,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Scrollbar(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: material.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              children: [
                                const Icon(
                                  Icons.book_online_outlined,
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                  height: 1,
                                ),
                                Text(
                                  material[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    height: 0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 330),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 247, 215, 205),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Publicar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownRow(String label) {
    return Container(
      width: 350,
      height: 35,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 60,
            child: Center(
              child: Text(
                ' $label:',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          getDropdownForLabel(label),
        ],
      ),
    );
  }

  Widget getDropdownForLabel(String label) {
    switch (label) {
      case 'GRADOS':
        return const CustomDropdownButton(
            ['Opción 1', 'Opción 2', 'Opción 3', 'Opción 4']);
      case 'SECCIÓN':
        return const CustomDropdownButton(
            ['Opción A', 'Opción B', 'Opción C', 'Opción D']);
      case 'CURSO':
        return const CustomDropdownButton(
            ['Curso 1', 'Curso 2', 'Curso 3', 'Curso 4']);
      case 'UNIDAD':
        return const CustomDropdownButton(
            ['Unidad A', 'Unidad B', 'Unidad C', 'Unidad D']);
      default:
        return Container();
    }
  }
}

class CustomDropdownButton extends StatefulWidget {
  final List<String> options;

  const CustomDropdownButton(this.options, {super.key});

  @override
  CustomDropdownButtonState createState() => CustomDropdownButtonState();
}

class CustomDropdownButtonState extends State<CustomDropdownButton> {
  String selectedOption = 'Seleccionar...';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            selectedOption,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return widget.options.map((String value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: Center(
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList();
            },
            onSelected: (String value) {
              setState(() {
                selectedOption = value;
              });
            },
            offset: const Offset(0, 30),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Icon(Icons.keyboard_arrow_down),
            ),
          ),
        ],
      ),
    );
  }
}
