import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: 100,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.pinkAccent, // Border color
              width: 2.0, // Border width
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.pinkAccent),
          ),
        ),
      ),
    );
  }
}
