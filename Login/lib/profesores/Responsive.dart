import 'package:flutter/material.dart';

class Responsive extends StatefulWidget {
  final String nombre;
  final List list;
  final Function(String)? onSelected;
  const Responsive({
    required this.nombre,
    required this.list,
    this.onSelected,
  });

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    const double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10*fem),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            borderRadius: BorderRadius.circular(30*fem)),
        width: screenSize.width,
        padding: EdgeInsets.symmetric(horizontal: 15*fem),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                "${widget.nombre} :",
                style: TextStyle(fontSize: 18*ffem),
              ),
            ),
            Container(
              width: screenSize.width/ 1.9,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.5), width: 0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(40*fem),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.5), width: 0),
                  ),
                ),
                hint: Text("Seleccionar ${widget.nombre}..."),
                style: TextStyle(fontSize: 18*ffem, color: Colors.black),
                dropdownColor: Color.fromRGBO(255, 234, 230, 1),
                borderRadius: BorderRadius.circular(15*fem),
                items: widget.list.map((name) {
                  return DropdownMenuItem(
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 16*ffem),
                    ),
                    value: name,
                  );
                }).toList(),
                onChanged: (Object? value) {
                  setState(() {
                    selectedValue = value as String?;
                  });

                  if (widget.onSelected != null) {
                    widget.onSelected!(selectedValue!);
                  }
                },
                isDense: true,
              ),
            )
          ],
        ));
  }
}
