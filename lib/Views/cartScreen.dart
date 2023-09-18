// ignore_for_file: file_names, avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Provider/cartProvider.dart';
import 'package:shopwow/Widgets/deliveryCtatext.dart';
import 'package:shopwow/Widgets/emptyCart.dart';

import '../Widgets/cartButton.dart';
import '../Widgets/cartWishlistButton.dart';

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
                return Stack(
                  children: [
                    ListView.builder(
                        itemCount: provider.cartProducts.length,
                        itemBuilder: (context, index) {
                          var cartProduct = provider.cartProducts[index];

                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 7, right: 7),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${cartProduct.category}".toUpperCase(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black)),
                                      Text("\$ ${cartProduct.price}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height: _widthHeight.screenHeight(
                                        context, 0.0012)),
                                CartButton(
                                  onPressed: () {
                                    provider.removeItFromCart(cartProduct);
                                  },
                                )
                              ],
                            ),
                          );
                        }),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.black,
                                      width: 0.3))),
                          child: Container(
                            height: 120,
                            padding: const EdgeInsets.all(14.0),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1)),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text("Order Amount \n This is the second line.", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                    )),
                                    Text(" \$ 1200.00", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18
                                    ),)
                                  ],
                                ),
                                CartWishlistButton(onPressed: () {  },)
                              ],
                            ),
                          ),
                        ))
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
