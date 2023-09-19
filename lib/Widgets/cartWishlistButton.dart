// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Const/widthheight.dart';

class CartWishlistButton extends StatelessWidget {
  final VoidCallback onPressed;
  CartWishlistButton({super.key, required this.onPressed});

  final WidthHeight _widthHeight = WidthHeight();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: _widthHeight.screenHeight(context, 0.05),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 252, 102, 194),
                Color.fromARGB(255, 252, 49, 143)
              ], // Replace with your desired colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "Add To Cart",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _widthHeight.screenHeight(context, 0.02),
              color: Colors.white),
        ),
      ),
    );
  }
}
