// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class NewContainer extends StatelessWidget {
  final child;
  const NewContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: screenSize.width,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(247, 215, 205, 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Color.fromRGBO(5, 5, 5, 0.5),
              blurStyle: BlurStyle.normal,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: child);
  }
}
