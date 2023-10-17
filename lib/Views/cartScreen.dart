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
                            padding: EdgeInsets.all(
                                _widthHeight.screenWidth(context, 0.012)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: _widthHeight.screenWidth(
                                          context, 0.07),
                                      right: _widthHeight.screenWidth(
                                          context, 0.07)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "${cartProduct.category}"
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: _widthHeight
                                                  .screenHeight(context, 0.016),
                                              color: Colors.black)),
                                      Text("\$ ${cartProduct.price}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: _widthHeight
                                                  .screenHeight(context, 0.016),
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
                                      color: Colors.black, width: 0.3))),
                          child: Container(
                            height: _widthHeight.screenHeight(context, 0.16),
                            padding: EdgeInsets.all(
                                _widthHeight.screenHeight(context, 0.01)),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: _widthHeight.screenHeight(
                                        context, 0.004)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Order Amount \n This is the second line.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: _widthHeight.screenHeight(
                                                context, 0.016))),
                                    Text(
                                      " \$ 1200.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: _widthHeight.screenHeight(
                                              context, 0.018)),
                                    )
                                  ],
                                ),
                                SizedBox(
                                    height: _widthHeight.screenHeight(
                                        context, 0.016)),
                                CartWishlistButton(onPressed: () {})
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
