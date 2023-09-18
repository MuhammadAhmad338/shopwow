import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopwow/Const/widthheight.dart';
import '../Models/Products.dart';
import '../Provider/wishlistProvider.dart';

class WishlistItem extends StatelessWidget {
  final Product wishlistItem;
  WishlistItem({super.key, required this.wishlistItem});

  final WidthHeight _widthHeight = WidthHeight();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WishlistProvider>(context);
    return Padding(
      padding:
          EdgeInsets.only(bottom: _widthHeight.screenHeight(context, 0.03)),
      child: GestureDetector(
        onTap: () {
          provider.toggleIt();
        },
        child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.4), width: 1.5))),
          child: SizedBox(
            height: _widthHeight.screenHeight(context, 0.11),
            width: double.infinity,
            child:
                Consumer<WishlistProvider>(builder: (context, provider, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: _widthHeight.screenHeight(context, 0.008)),
                    child: Container(
                        height: _widthHeight.screenHeight(context, 0.2),
                        width: _widthHeight.screenWidth(context, 0.2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: Colors.black12),
                        child: Image.network(wishlistItem.image!.toString(),
                            fit: BoxFit.fill, height: 7, width: 20)),
                  ),
                  Text(wishlistItem.category.toString().toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis),
                  provider.toggleButton
                      ? Container(
                          height: 30,
                          width: 30,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            color: Colors.pinkAccent.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: Image.asset("assets/images/checkmark.png",
                              height: 30, width: 30),
                     )
                      : Image.asset("assets/images/checkmark.png",
                          height: 30, width:30)
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
