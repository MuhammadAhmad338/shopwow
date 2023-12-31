// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Const/widthheight.dart';

class CategoriesListTile extends StatefulWidget {
  final String title;
  final String imageAsset;

  const CategoriesListTile(
      {super.key, required this.title, required this.imageAsset});

  @override
  State<CategoriesListTile> createState() => _CategoriesListTileState();
}

class _CategoriesListTileState extends State<CategoriesListTile> {
  final WidthHeight _heightWidth = WidthHeight();
  bool toggleProducts = false;

  void toggleIt() {
    setState(() {
      toggleProducts = !toggleProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => toggleIt(),
          child: ListTile(
            title: Row(
              children: [
                widget.imageAsset.isNotEmpty ?  Image.asset(widget.imageAsset.toString(),
                    width: _heightWidth.screenHeight(context, 0.04),
                    height: _heightWidth.screenHeight(context, 0.04)): const SizedBox(height: 0),
                 SizedBox(width: _heightWidth.screenWidth(context, 0.010)),
                Text(widget.title.toString()),
              ],
            ),
            trailing: Image.asset(
                !toggleProducts
                    ? "assets/images/arrow-down-sign-to-navigate.png"
                    : "assets/images/upload.png",
                height: _heightWidth.screenHeight(context, 0.05),
                width: _heightWidth.screenWidth(context, 0.05)),
          ),
        ),
        Visibility(
          visible: toggleProducts,
          child: GridView.builder(
              physics: const ScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                  crossAxisCount: 2),
              itemBuilder: ((context, index) {
                return Container(
                    height: _heightWidth.screenHeight(context, 0.0100),
                    width: _heightWidth.screenWidth(context, 0.0100),
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Image.asset(
                      "assets/images/filter.png",
                      fit: BoxFit.contain,
                    ));
              })),
        )
      ],
    );
  }
}
