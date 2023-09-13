// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Views/cartScreen.dart';
import 'package:shopwow/Views/categoriesScreen.dart';
import 'package:shopwow/Views/homeScreen.dart';
import 'package:shopwow/Views/profileScreen.dart';
import '../Views/wishlistScreen.dart';

class BottomBarProvider with ChangeNotifier {
  int _bottomIndex = 0;
  int get bottomIndex => _bottomIndex;
  final _screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    WishlistScreen(),
    ProfileScreen()
  ];

  List<Widget> get screens => _screens; 

  changeIndex(int index) {
    _bottomIndex = index;
    notifyListeners();
  }

}