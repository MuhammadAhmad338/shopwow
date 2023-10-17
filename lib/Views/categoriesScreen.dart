// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Views/searchScreen.dart';
import 'package:shopwow/Widgets/categoriesListTile.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final double spaceBetweenCategories = 40.0;
  final WidthHeight _widthHeight = WidthHeight();
  
  final List<Map<String, String>> categories = [
    {"icon": "assets/images/diamond-ring.png", "name": "Jewelry"},
    {"icon": "assets/images/polo.png", "name": "Men's Clothing"},
    {"icon": "assets/images/responsive.png", "name": "Electronics"},
    {"icon": "assets/images/long-sleeves-dress.png", "name": "Women Clothing"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: _widthHeight.screenHeight(context, 0.15),
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                 SizedBox(
                  height: _widthHeight.screenHeight(context, 0.030),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize:
                                _widthHeight.screenHeight(context, 0.028))),
                    SizedBox(width: _widthHeight.screenWidth(context, 0.1)),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
                      },
                      child: Image.asset("assets/images/search.png",
                          color: Colors.white, width: 20, height: 20),
                    )
                  ],
                ),
                SizedBox(height: _widthHeight.screenHeight(context, 0.00065)),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final iconPath = category["icon"];
                        return Row(
                          children: [
                            SizedBox(width: spaceBetweenCategories),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(iconPath!,
                                    color: Colors.white, height: 35, width: 35),
                                SizedBox(
                                    height: _widthHeight.screenHeight(
                                        context, 0.006)),
                                Text(category["name"].toString(),
                                    style: const TextStyle(
                                        fontSize: 8, color: Colors.white))
                              ],
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                var category = categories[index];
                return CategoriesListTile(
                    title: category["name"].toString(),
                    imageAsset: category["icon"]!);
              }),
        )
      ],
    ));
  }
}
