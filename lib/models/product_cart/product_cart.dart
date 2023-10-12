import 'package:nws_huydq_ecommerce_flutter/models/detail_categories/product.dart';

class ProductCart {
  Product? prodcut;
  int sizeIndex;
  int colorIndex;

  ProductCart({
    this.prodcut,
    this.sizeIndex=0,
    this.colorIndex=0
  });

}
