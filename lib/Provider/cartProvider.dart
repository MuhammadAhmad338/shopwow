// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopwow/Models/Products.dart';

class CartProvider extends ChangeNotifier {
  List<Product> _cartProducts = [];
  List<Product> get cartProducts => _cartProducts;

  static const String cartKey = 'cartlist';

  CartProvider() {
    _loadCartList();
  }

  Future<void> _loadCartList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? cartList = prefs.getStringList(cartKey);
    if (cartList != null) {
      _cartProducts =
          cartList.map((item) => Product.fromJsonString(item)).toList();
    }
    notifyListeners();
  }

  _saveCartList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> cartListJson =
        _cartProducts.map((products) => products.toJsonString()).toList();
    prefs.setStringList(cartKey, cartListJson);
  }

  void addToCart(Product product) {
    if (!_cartProducts.contains(product)) {
      _cartProducts.add(product);
      _saveCartList();
      notifyListeners();
    }
  }

  void removeItFromCart(Product product) {
    _cartProducts.removeWhere((element) => element.id == product.id);
    _saveCartList();
    notifyListeners();
  }

  void clearCart() {
    _cartProducts.clear();
    _saveCartList();
    notifyListeners();
  }
}
