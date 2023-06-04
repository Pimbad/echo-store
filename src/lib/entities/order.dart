import 'package:echo_store/entities/cart.product.dart';

class Order{
   String id;
   double price;
   List<CartProduct> itens;

   Order(
    this.id,
    this.price,
    this.itens
   );

    factory Order.fromJson(dynamic json) =>
      Order(
        json['id'] as String,
        json['price'] as double,
        List<CartProduct>.from(json['itens'].map((cartProduct)
          => CartProduct.fromJson(cartProduct))));
}