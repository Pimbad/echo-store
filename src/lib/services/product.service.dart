import 'dart:convert';

import 'package:echo_store/entities/product.dart';
import 'package:echo_store/services/base.service.dart';

class ProductService extends BaseService {

  Future<List<Product>> getProductsAsync() async {
    var response = await getAsync("products");

    if(response.statusCode == 200){
      final body = json.decode(response.body);

      return List<Product>.from(body.map((product)
        => Product.fromJson(product)));
    }

    return List.empty();
  }

  Future<Product?> getProductById(int productId) async {
    var response = await getAsync("products/$productId");

    if(response.statusCode == 200){
      final body = json.decode(response.body);

      return Product.fromJson(body);
    }

    return null;
  }
}
