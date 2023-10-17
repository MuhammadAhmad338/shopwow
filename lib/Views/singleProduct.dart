// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopwow/Const/constants.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Models/Products.dart';
import 'package:shopwow/Provider/cartProvider.dart';
import 'package:shopwow/Widgets/cartWishlistButton.dart';
import 'package:shopwow/Widgets/categoriesListTile.dart';

class SingleProductScreen extends StatefulWidget {
  final Product product;
  const SingleProductScreen({super.key, required this.product});

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  final WidthHeight _widthHeight = WidthHeight();

  @override
  Widget build(BuildContext context) {
    var cartProv = Provider.of<CartProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.4), width: 1))),
              child: SizedBox(
                  height: _widthHeight.screenHeight(context, 0.070),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: _widthHeight.screenWidth(context, 0.08),
                        right: _widthHeight.screenWidth(context, 0.08)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              "assets/images/back.png",
                              height: _widthHeight.screenHeight(context, 0.06),
                              width: _widthHeight.screenWidth(context, 0.06),
                            )),
                        Text("Product",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    _widthHeight.screenWidth(context, 0.05),
                                color: Colors.black)),
                        Image.asset(
                          "assets/images/share.png",
                          height: _widthHeight.screenHeight(context, 0.06),
                          width: _widthHeight.screenWidth(context, 0.06),
                        ),
                      ],
                    ),
                  )),
            ),
            ConstrainedBox(
                constraints: const BoxConstraints.expand(height: 350),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: _widthHeight.screenHeight(context, 0.010),
                      left: _widthHeight.screenWidth(context, 0.040),
                      right: _widthHeight.screenWidth(context, 0.040)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Ahmad",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text("\$ ${widget.product.price}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                          height: _widthHeight.screenHeight(context, 0.01)),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ahmad",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text("\$ 112.00",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                          height: _widthHeight.screenHeight(context, 0.010)),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                height: _widthHeight.screenHeight(context, 0.3),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey.withOpacity(0.1)),
                                child: Image.network(
                                  widget.product.image!.toString(),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Positioned(
                            top: _widthHeight.screenHeight(context, 0.01),
                            right: _widthHeight.screenWidth(context, 0.01),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Image.asset(
                                "assets/images/heart.png",
                                fit: BoxFit.contain,
                                color: Colors.black,
                                height:
                                    _widthHeight.screenHeight(context, 0.07),
                                width: _widthHeight.screenWidth(context, 0.07),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox(height: _widthHeight.screenHeight(context, 0.010)),
            ConstrainedBox(
              constraints: BoxConstraints.expand(
                  height: _widthHeight.screenHeight(context, 0.17)),
              child: Container(
                color: Colors.grey.withOpacity(0.2),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Select Size",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text("Size Chart",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ],
                      ),
                      SizedBox(
                          height: _widthHeight.screenHeight(context, 0.010)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartWishlistButton(
                          onPressed: () {
                            cartProv.addToCart(widget.product);
                            showToast("Added To Cart!");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CategoriesListTile(title: "Description", imageAsset: ""),
            const CategoriesListTile(title: "Specification", imageAsset: ""),
            const CategoriesListTile(title: "Reviews", imageAsset: ""),
            const CategoriesListTile(
                title: "Shipping and Delivery", imageAsset: ""),
            SizedBox(height: _widthHeight.screenHeight(context, 0.02)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Similar Items/Products",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16)),
                Text("Select All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red))
              ],
            ),
            ListView.builder(
                itemCount: 12,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 20,
                    color: Colors.white70,
                  );
                })
          ]),
        ),
      ),
    );
  }
}
