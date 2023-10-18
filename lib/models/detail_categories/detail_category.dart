import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';

class DetailCategory {
  int id;
  String category;
  List<Product> products;

  DetailCategory({
    this.id = 0,
    this.category="",
    this.products =const [],
  });

  factory DetailCategory.fromJson(Map<String, dynamic> json) {
    return DetailCategory(
      
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
