class Product {
  final int id;
  final String name;
  final double price;
  final String img;
  final int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'] ?? '',
      price: double.parse(json['price']),
      img: json['img'] ?? '',
      quantity: json['quantity'] ?? 0,
    );
  }
}
