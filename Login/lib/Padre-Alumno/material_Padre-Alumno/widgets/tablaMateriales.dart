import 'package:flutter/material.dart';

class TablaMateriales extends StatelessWidget {
  final String sesion;
  final String teoria;
  final String practica;
  const TablaMateriales(
      {super.key,
      required this.sesion,
      required this.teoria,
      required this.practica});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 30,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                sesion,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: screenSize.width / 3.3,
            decoration: BoxDecoration(
                border: Border.symmetric(vertical: BorderSide(width: 1))),
            child: Text(
              teoria,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: screenSize.width / 3.3,
            child: Text(
              practica,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(250, 234, 230, 1),
          border: Border.all(color: Color.fromRGBO(166, 145, 138, 1))),
    );
  }
}
