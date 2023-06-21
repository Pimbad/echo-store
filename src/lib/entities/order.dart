import 'package:echo_store/entities/cart.product.dart';

class Order {
  String id;
  num price;
  String createdAt;
  List<CartProduct> itens;

  Order(this.id, this.price, this.createdAt, this.itens);

  factory Order.fromJson(dynamic json) => Order(
      json['id'] as String,
      json['price'] as num,
      json['createdAt'] as String,
      List<CartProduct>.from(json['itens']
          .map((cartProduct) => CartProduct.fromJson(cartProduct))));
}
