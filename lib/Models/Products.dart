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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      ratingRate: double.tryParse(json['rating_rate'].toString()) ?? 0.0,
      ratingCount: json['rating_count'] as int,
    );
  }
}
