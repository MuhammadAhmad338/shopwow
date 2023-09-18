// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Models/Products.dart';

class ApiServices with ChangeNotifier {

  List<Product> _searchProducts = [];
  List<Product> get searchProducts => _searchProducts;

  Future<List<Product>> getProducts() async {
    Response response = await http.get(
        Uri.parse('https://webappoo8.onrender.com/products/allProducts'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products =
          data.map((item) => Product.fromMap(item)).toList();

      return products;
    } else {
      throw ("Can't get the Articles");
    }
  }

  Future<List<Product>> getProductsByCategory(String query) async {
    Response response = await http.get(
        Uri.parse(
            "https://webappoo8.onrender.com/products/search?title=${query}"),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products =
          data.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw ("Can't got the products");
    }
  }

  searchTheProducts(String query) async {
     Response response = await http.get(Uri.parse("https://webappoo8.onrender.com/products/search?title=${query}"),
     headers: {"Content-Type": "application/json"});
     if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Product> products = data.map((e) => Product.fromJson(e)).toList();
        _searchProducts = products;
        notifyListeners();
     } else {
      throw "Some error Occured!";
     }
  }

    void clearSearchResults() {
    _searchProducts.clear();
    notifyListeners();
  }


}
