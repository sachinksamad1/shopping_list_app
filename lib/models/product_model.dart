class Product {
  final int id;
  final String title;
  final double price;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });

  // A factory constructor for creating a new Product instance from a map.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      // Ensure price is treated as a double
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'],
    );
  }
}