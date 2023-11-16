import 'package:flutter/material.dart';

class SeleccionOpcion extends StatefulWidget {
  final String nombre;
  final List list;
  final Function(String)? onSelected;
  const SeleccionOpcion({
    required this.nombre,
    required this.list,
    this.onSelected,
  });

  @override
  State<SeleccionOpcion> createState() => _SeleccionOpcionState();
}

class _SeleccionOpcionState extends State<SeleccionOpcion> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            borderRadius: BorderRadius.circular(30)),
        width: screenSize.width,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Text(
                "${widget.nombre} :",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              width: screenSize.width / 1.8,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.5), width: 0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 0.5), width: 0),
                  ),
                ),
                hint: Text("Seleccionar ${widget.nombre}..."),
                style: TextStyle(fontSize: 18, color: Colors.black),
                dropdownColor: Color.fromRGBO(255, 234, 230, 1),
                borderRadius: BorderRadius.circular(15),
                items: widget.list.map((name) {
                  return DropdownMenuItem(
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 18),
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
