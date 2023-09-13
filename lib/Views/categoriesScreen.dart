// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Const/widthheight.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final WidthHeight _widthHeight = WidthHeight();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: _widthHeight.screenHeight(context, 0.09),
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      const Text("Categories", style: TextStyle(
                        fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16
                      ),),
                      SizedBox(width: _widthHeight.screenWidth(context, 0.1)),
                      Image.asset("assets/images/search.png",
                      color: Colors.white,
                       width: 20, height: 20)
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}