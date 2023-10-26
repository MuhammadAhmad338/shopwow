// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Const/widthheight.dart';

class CartButton extends StatelessWidget {
  final VoidCallback onPressed;
  CartButton({super.key, required this.onPressed});

  final WidthHeight _widthHeight = WidthHeight();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 4,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              left: _widthHeight.screenWidth(context, 0.03),
              right: _widthHeight.screenWidth(context, 0.03)),
          height: _widthHeight.screenHeight(context, 0.055),
          decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(
                  _widthHeight.screenWidth(context, 0.02))),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("REMOVE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white)),
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
