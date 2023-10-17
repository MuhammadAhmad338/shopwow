import 'package:flutter/material.dart';

class WishlistButton extends StatelessWidget {
  final String text;
  const WishlistButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.4)),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 252, 102, 194),
              Color.fromARGB(255, 252, 49, 143)
            ],
          ),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
