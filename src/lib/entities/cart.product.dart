import 'package:echo_store/entities/product.dart';

class CartProduct{
  Product product;
  int count;

  CartProduct(this.count, this.product);

   factory CartProduct.fromJson(dynamic json) =>
      CartProduct(
        json['count'] as int,
        Product.fromJson(json['product']));

    Map<String, dynamic> toJson() => {
        "count": count,
        "product": product.toJson()
    };
}