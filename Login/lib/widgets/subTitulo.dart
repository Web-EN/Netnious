import 'package:flutter/material.dart';

class SubTitulo extends StatelessWidget {
  final String subTitulo;
  const SubTitulo({super.key, required this.subTitulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        "$subTitulo:",
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
