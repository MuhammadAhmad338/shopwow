import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Models/Products.dart';
import 'package:shopwow/Provider/counterProvider.dart';
import 'package:shopwow/Provider/wishlistProvider.dart';

class HomeItem extends StatefulWidget {
  final Product product;
  const HomeItem({super.key, required this.product});

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
  final WidthHeight _widthHeight = WidthHeight();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CounterProvider>(context);
    var wishlistProvider = Provider.of<WishlistProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
                height: _widthHeight.screenHeight(context, 0.1),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(
                        _widthHeight.screenWidth(context, 0.02))),
                child: Image.network(widget.product.image.toString(),
                    fit: BoxFit.fill, height: 10, width: 10)),
            GestureDetector(
              onTap: () {
                // provider.changeFavourite();
                wishlistProvider.addToWishlist(widget.product);
              },
              child: Image.asset("assets/images/heart.png",
                  color: provider.isFavourite ? Colors.red : Colors.grey,
                  height: 22,
                  width: 22),
            ),
          ],
        ),
        Text("${widget.product.title}",
            maxLines: 2,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black)),
        Text("${widget.product.category}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black)),
        Text(
          "\$ ${widget.product.price}",
        )
      ],
    );
  }
}
