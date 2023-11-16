import 'package:flutter/material.dart';

class SubTitulo extends StatelessWidget {
  final String subTitulo;
  const SubTitulo({required this.subTitulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        "${subTitulo}:",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
