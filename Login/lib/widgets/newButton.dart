import 'package:flutter/material.dart';

class NewButton extends StatelessWidget {
  final String title;
  final VoidCallback action;
  const NewButton({super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Color.fromRGBO(247, 215, 205, 1),
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurStyle: BlurStyle.normal,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(250, 255, 255, 0.5)),
        onPressed: action,
        child: Text(
          title,
          style: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 18),
        ),
      ),
    );
  }
}
