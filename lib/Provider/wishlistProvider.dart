// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Models/Products.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistProvider extends ChangeNotifier {
  List<Product> _wishlists = [];
  List<Product> get wishlists => _wishlists;
  bool _toggleButton = false;
  bool get toggleButton => _toggleButton;
// Key to identify the wishlist data in SharedPreferences
  static const String wishlistKey = 'wishlist';

  WishlistProvider() {
    _loadWishlistData();
  }

  Future<void> _loadWishlistData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? savedWishlist = prefs.getStringList(wishlistKey);

    if (savedWishlist != null) {
      _wishlists = savedWishlist
          .map((jsonString) => Product.fromJsonString(jsonString))
          .toList();
    }

    notifyListeners();
  }

  void _saveWishlistData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> wishlistJsonList =
        _wishlists.map((product) => product.toJsonString()).toList();
    prefs.setStringList(wishlistKey, wishlistJsonList);
  }

  void addToWishlist(Product product) {
    if (!_wishlists.contains(product)) {
      _wishlists.add(product);
      _saveWishlistData();
      notifyListeners();
    }
  }

  void removeProductFromWishlist(Product product) {
    _wishlists.removeWhere((item) => item.id == product.id);
    _saveWishlistData();
    notifyListeners();
  }

  void clearTheWishlist() {
    _wishlists.clear();
    _saveWishlistData();
    notifyListeners();
  }

  void toggleIt() {
    _toggleButton = !_toggleButton;
    notifyListeners();
  }

}
