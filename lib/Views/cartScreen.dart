// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Provider/cartProvider.dart';
import 'package:shopwow/Widgets/deliveryCtatext.dart';
import 'package:shopwow/Widgets/emptyCart.dart';

import '../Widgets/cartButton.dart';

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
            Expanded(
              child:
                  Consumer<CartProvider>(builder: (context, provider, child) {
                if (provider.cartProducts.isEmpty) {
                  return EmptyCart();
                }
                return ListView.builder(
                    itemCount: provider.cartProducts.length,
                    itemBuilder: (context, index) {
                      var cartProduct = provider.cartProducts[index];

                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 7, right: 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${cartProduct.category}", style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  )),
                                  Text("${cartProduct.price}", style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ))
                                ],
                              ),
                            ),
                            SizedBox(height: _widthHeight.screenHeight(context, 0.0012)),
                            CartButton(onPressed: () {
                              provider.removeItFromCart(cartProduct);
                            },)
                          ],
                        ),
                      );
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}
