// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final double? ratingRate;
  final int? ratingCount;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.ratingRate,
    this.ratingCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'ratingRate': ratingRate,
      'ratingCount': ratingCount,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int?,
      title: map['title'] as String?,
      price: map['price'] != null ? double.parse(map['price'] as String) : null,
      description: map['description'] as String?,
      category: map['category'] as String?,
      image: map['image'] as String?,
      ratingRate: map['ratingRate'] != null
          ? double.parse(map['ratingRate'] as String)
          : null,
      ratingCount: map['ratingCount'] as int?,
    );
  }

  factory Product.fromJsonString(String jsonString) {
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  return Product(
    id: jsonMap['id'] as int?,
    title: jsonMap['title'] as String?,
    price: jsonMap['price'] != null ? jsonMap['price'].toDouble() : null,
    description: jsonMap['description'] as String?,
    category: jsonMap['category'] as String?,
    image: jsonMap['image'] as String?,
    ratingRate: jsonMap['rating_rate'] != null ? jsonMap['rating_rate'].toDouble() : null,
    ratingCount: jsonMap['rating_count'] as int?,
  );
}

  String toJsonString() {
  final Map<String, dynamic> data = toMap();
  return jsonEncode(data); // You need to import 'dart:convert' for this.
}

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
