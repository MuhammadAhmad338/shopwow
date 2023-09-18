// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Provider/wishlistProvider.dart';
import 'package:shopwow/Widgets/emptyWishlist.dart';
import 'package:shopwow/Widgets/whishlistButton.dart';
import 'package:shopwow/Widgets/wishlistItem.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WidthHeight _widthHeight = WidthHeight();

  @override
  Widget build(BuildContext context) {
    var wishlistProvider = Provider.of<WishlistProvider>(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: _widthHeight.screenHeight(context, 0.07),
            decoration: const BoxDecoration(color: Colors.black87),
            child: const Align(
              alignment: Alignment.center,
              child: Text("Wishlist",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Expanded(
            child:
                Consumer<WishlistProvider>(builder: (context, provider, child) {
              if (provider.wishlists.isEmpty) {
                return EmptyWishlist();
              }
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: provider.wishlists.length,
                        itemBuilder: (context, index) {
                          var wishlistProduct = provider.wishlists[index];
                          return WishlistItem(
                            wishlistItem: wishlistProduct,
                          );
                        }),
                  ),
                  wishlistProvider.toggleButton
                      ? Consumer<WishlistProvider>(
                          builder: (context, provider, child) {
                          return Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: Colors.grey.withOpacity(0.1),
                              height: _widthHeight.screenHeight(context, 0.1),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  WishlistButton(text: "CLEAR"),
                                  WishlistButton(text: "REMOVE")
                                ],
                              ),
                            ),
                          );
                        })
                      : const SizedBox(),
                ],
              );
            }),
          )
        ],
      ),
    ));
  }
}
