import 'package:echo_store/entities/product.rate.dart';

class Product{
  int id;
  String title;
  num price;
  String description;
  String category;
  String imageUrl;
  ProductRate rating;

  Product(
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.imageUrl,
    this.rating);

    factory Product.fromJson(dynamic json) =>
      Product(
        json['id'] as int,
        json['title'] as String,
        json['price'] as num,
        json['description'] as String,
        json['category'] as String,
        json['image'] as String,
        ProductRate.fromJson(json['rating']));

}