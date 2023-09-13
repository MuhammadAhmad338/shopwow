// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Widgets/appbutton.dart';
import 'package:shopwow/Widgets/deliveryCtatext.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final WidthHeight _widthHeight = WidthHeight();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: _widthHeight.screenHeight(context, 0.07),
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text("2 Items in the cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            
                const DeliveryCtaText(),
               
          ],
        ),
      ),
    );
  }
}
