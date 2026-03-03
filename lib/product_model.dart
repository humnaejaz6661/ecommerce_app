class ProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String? label;

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.label,
  });
}

class Category {
  final String image;
  final String title;

  Category({required this.image, required this.title});
}
