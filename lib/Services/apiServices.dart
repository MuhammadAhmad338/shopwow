// ignore_for_file: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Models/Products.dart';

class ApiServices {
  
  Future<List<Product>> getProducts() async {
    Response response = await http.get(
        Uri.parse('https://webappoo8.onrender.com/products/allProducts'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Product> products = data.map((item) => Product.fromJson(item)).toList();
      
      return products;
    } else {
      throw ("Can't get the Articles");
    }
  }

}
