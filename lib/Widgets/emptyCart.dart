// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Const/widthheight.dart';

class EmptyCart extends StatelessWidget {
   EmptyCart({super.key});

  final WidthHeight _widthHeight = WidthHeight();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/empty-cart.png",
            height: _widthHeight.screenHeight(context, 0.18),
          ),
          SizedBox(height: _widthHeight.screenHeight(context, 0.009),),
          Text(
            "Cart is Empty!",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: _widthHeight.screenHeight(context, 0.020)),
          ),
        ],
      ),
    );
  }
}
