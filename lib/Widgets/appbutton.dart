import 'package:flutter/material.dart';
import '../Const/widthheight.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  final WidthHeight _widthHeight = WidthHeight();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: _widthHeight.screenHeight(context, 0.04),
        width: _widthHeight.screenWidth(context, 0.3),
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
            widget.text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.pinkAccent),
          ),
        ),
      ),
    );
  }
}
