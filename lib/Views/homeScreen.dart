// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Models/Products.dart';
import 'package:shopwow/Services/apiServices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices _apiServices = ApiServices();
  final WidthHeight _widthHeight = WidthHeight();
  final double spaceBetweenCategories = 40.0;
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
          height: _widthHeight.screenHeight(context, 0.17),
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Padding(
            padding:
                EdgeInsets.only(top: _widthHeight.screenHeight(context, 0.020)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text("ShopWow",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    _widthHeight.screenWidth(context, 0.05),
                                color: Colors.white)),
                        SizedBox(
                          width: _widthHeight.screenWidth(context, 0.010),
                        ),
                        Image.asset("assets/images/panda.png",
                            width: _widthHeight.screenWidth(context, 0.08),
                            height: _widthHeight.screenHeight(context, 0.08))
                      ],
                    ),
                    SizedBox(width: _widthHeight.screenWidth(context, 0.02)),
                    SizedBox(width: _widthHeight.screenWidth(context, 0.11)),
                    Image.asset("assets/images/filterit.png",
                        color: Colors.white,
                        height: _widthHeight.screenHeight(context, 0.06),
                        width: _widthHeight.screenWidth(context, 0.06)),
                    SizedBox(width: _widthHeight.screenWidth(context, 0.05)),
                    Image.asset("assets/images/search.png",
                        color: Colors.white,
                        height: _widthHeight.screenHeight(context, 0.035),
                        width: _widthHeight.screenHeight(context, 0.035)),
                    SizedBox(width: _widthHeight.screenWidth(context, 0.04)),
                  ],
                ),
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
        SizedBox(height: _widthHeight.screenHeight(context, 0.010)),
        SizedBox(
          width: double.infinity, // Expand horizontally within the Column
          height: _widthHeight.screenHeight(
              context, 0.28), // Set the desired height for the ListView
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3, // Replace with the desired number of items
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.all(_widthHeight.screenHeight(context, 0.009)),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        _widthHeight.screenWidth(context, 0.028)),
                  ),
                  child: Container(
                    width: _widthHeight.screenWidth(
                        context, 0.8), // Set the desired width for each item
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(
                          _widthHeight.screenWidth(context, 0.028)),
                    ),
                    child: Center(
                      child: Text(
                        "Flat 50% OFF",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: _widthHeight.screenHeight(context, 0.04)),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: _widthHeight.screenHeight(context, 0.010)),
        Padding(
          padding: EdgeInsets.only(
              left: _widthHeight.screenWidth(context, 0.04),
              right: _widthHeight.screenWidth(context, 0.04)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Selling Items",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Text(
                "Show All",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: _widthHeight.screenWidth(context, 0.03),
              right: _widthHeight.screenWidth(context, 0.03),
            ),
            child: FutureBuilder<List<Product>>(
                future: _apiServices.getProducts(),
                builder: (context, snapshot) {
                  var products = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("No Products Available!"));
                  } else {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 3.0,
                                crossAxisSpacing: 3.0,
                                crossAxisCount: 2),
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          var product = products[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height:
                                      _widthHeight.screenHeight(context, 0.1),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(
                                          _widthHeight.screenWidth(
                                              context, 0.02))),
                                  child: Image.network(product.image.toString(),
                                      fit: BoxFit.fill, height: 10, width: 10)),
                              Text("${product.title}",
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Text(
                                "${product.price}",
                              )
                            ],
                          );
                        });
                  }
                }),
          ),
        )
      ],
    ));
  }
}
