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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: _widthHeight.screenHeight(context, 0.14),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("ShopWow",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white)),
                    SizedBox(width: _widthHeight.screenWidth(context, 0.08)),
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
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
