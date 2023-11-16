import 'package:flutter/material.dart';

class NewContainer extends StatelessWidget {
  final child;
  const NewContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: screenSize.width,
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 215, 205, 1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
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
