// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shopwow/Models/Products.dart';
import 'package:shopwow/Models/cart.dart';

class CartProvider with ChangeNotifier {
  List<CartProducts> _cartProducts = [];
  List<CartProducts> get cartProducts => _cartProducts;

  void addToCart(Product product) {
    var existingProduct =
        _cartProducts.firstWhere((element) => element.id == product.id);
    if (existingProduct != null) {
      existingProduct.quantity = existingProduct.quantity! + 1;
    } else {
      _cartProducts.add(product as CartProducts);
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    var productExists =
        _cartProducts.firstWhere((element) => element.id == product.id);
    if (productExists != null) {
      productExists.quantity = productExists.quantity! - 1;
    } else {
      _cartProducts.remove(product as CartProducts);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartProducts = [];
    notifyListeners();
  }
}
