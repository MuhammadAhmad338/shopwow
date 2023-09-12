class CartProducts {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final int? price;
  int? quantity;

  CartProducts(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.price,
      this.quantity});
}
