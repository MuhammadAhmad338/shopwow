// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Services/apiServices.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices _apiServices = ApiServices();
  final WidthHeight _widthHeight = WidthHeight();
  final List<Map<String, String>> categories = [
    {"icon": "assets/images/diamond-ring.png", "name": "jewelry"},
    {"icon": "assets/images/polo.png", "name": "men's clothing"},
    {"icon": "assets/images/responsive.png", "name": "electronics"},
    {"icon": "assets/images/long-sleeves-dress.png", "name": "women clothing"},

  ];
   final double spaceBetweenCategories = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: _widthHeight.screenHeight(context, 0.16),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Row(
                      children: [
                        const Text("ShopWow",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white)),
                        const SizedBox(width: 10,),
                        Image.asset("assets/images/panda.png", width: 35, height: 35)
                      ],
                    ),
                    SizedBox(width: _widthHeight.screenWidth(context, 0.02)),
                    SizedBox(width: _widthHeight.screenWidth(context, 0.11)),
                    Image.asset("assets/images/filter.png",
                        color: Colors.white,
                        height: _widthHeight.screenHeight(context, 0.08),
                        width: _widthHeight.screenWidth(context, 0.08)),
                    SizedBox(width: _widthHeight.screenWidth(context, 0.05)),
                    Image.asset("assets/images/search.png",
                        color: Colors.white,
                        height: _widthHeight.screenHeight(context, 0.035),
                        width: _widthHeight.screenHeight(context, 0.035)),
                    SizedBox(width: _widthHeight.screenWidth(context, 0.02)),
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
                                    SizedBox(height: _widthHeight.screenHeight(context, 0.006)),
                                    Text(category["name"].toString(), style: const TextStyle(
                                      fontSize: 8,color: Colors.white
                                    ))
                              ],
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
