// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Const/widthheight.dart';

class CategoriesListTile extends StatefulWidget {
  
  final String title;
  final String imageAsset;
  
  const CategoriesListTile(
      {super.key,
      required this.title,
      required this.imageAsset});

  @override
  State<CategoriesListTile> createState() => _CategoriesListTileState();
}

class _CategoriesListTileState extends State<CategoriesListTile> {
  final WidthHeight _heightWidth = WidthHeight();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        title: Row(
          children: [
            Image.asset(widget.imageAsset.toString(),
                width: _heightWidth.screenHeight(context, 0.04),
                height: _heightWidth.screenHeight(context, 0.04)),
            const SizedBox(width: 10),
            Text(widget.title.toString()),
          ],
        ),
        trailing: Image.asset("assets/images/down-arrow.png",
            height: _heightWidth.screenHeight(context, 0.05),
            width: _heightWidth.screenWidth(context, 0.05)),
      ),
    );
  }
}
