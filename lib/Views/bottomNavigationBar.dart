// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopwow/Const/widthheight.dart';
import 'package:shopwow/Provider/bottomNavProvider.dart';

class BottomNavigationBars extends StatefulWidget {
  const BottomNavigationBars({super.key});

  @override
  State<BottomNavigationBars> createState() => _BottomNavigationBarsState();
}

class _BottomNavigationBarsState extends State<BottomNavigationBars> {
  final WidthHeight _widthHeight = WidthHeight();
  
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      body: cartProvider.screens[cartProvider.bottomIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: cartProvider.bottomIndex,
          onDestinationSelected: (index) {
            cartProvider.changeIndex(index);
          },
          elevation: 1,
          destinations:  [
            NavigationDestination(icon: Image.asset("assets/images/home.png", width: _widthHeight.screenWidth(context, 0.05), height:  _widthHeight.screenHeight(context, 0.03),), label: "Home"),
            NavigationDestination(icon: Image.asset("assets/images/category.png", width: _widthHeight.screenWidth(context, 0.05), height:  _widthHeight.screenHeight(context, 0.03)), label: "Wishlist"),
            NavigationDestination(icon: Image.asset("assets/images/shopping-cart.png",width: _widthHeight.screenWidth(context, 0.05), height:  _widthHeight.screenHeight(context, 0.03), ), label: "Cart"),
            NavigationDestination(icon: Image.asset("assets/images/heart.png", width: _widthHeight.screenWidth(context, 0.05), height:  _widthHeight.screenHeight(context, 0.03),), label: "asd"),
            NavigationDestination(icon: Image.asset("assets/images/home.png", width: _widthHeight.screenWidth(context, 0.05), height:  _widthHeight.screenHeight(context, 0.03),), label: "asdasdd"),
          ]),
    );
  }
}
