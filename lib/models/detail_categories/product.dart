class Product {
  int id;
  String title;
  int price;
  String description;
  List<dynamic> images;

  String category;

  Product({
    this.id = 0,
    this.title = "",
    this.price = 0,
    this.description = "",
    this.images = const [],
    this.category="",
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as int,
      description: json['description'] as String,
      images: json['images'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'images': images,
      };
}
