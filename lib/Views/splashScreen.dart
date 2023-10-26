// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Views/bottomNavigationBar.dart';

import '../Const/widthheight.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 
  final WidthHeight _widthHeight = WidthHeight();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BottomNavigationBars()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("Shop Wow",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: _widthHeight.screenHeight(context, 0.026))),
            SizedBox(height: _widthHeight.screenHeight(context, 0.00001)),
            Image.asset(
              'assets/images/panda.png',
              width: _widthHeight.screenWidth(context, 0.47),
              height: _widthHeight.screenHeight(context, 0.17)
            )
          ]),
        ),
      ),
    );
  }
}
