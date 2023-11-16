import 'package:flutter/material.dart';

class CuadroTablaEvaluations extends StatelessWidget {
  final String title;
  final String fecha;
  const CuadroTablaEvaluations({required this.title, required this.fecha});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Row(
              children: [
                Image(
                    image: AssetImage(
                        "assets/page-1/images/icon_task_square_.png")),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          )),
          Container(
            alignment: Alignment.center,
            width: 80,
            decoration: BoxDecoration(
                border: Border.symmetric(vertical: BorderSide(width: 1))),
            child: Text(
              fecha,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(250, 234, 230, 1),
          border: Border.all(color: Color.fromRGBO(166, 145, 138, 1))),
    );
    ;
  }
}
