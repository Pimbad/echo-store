import 'dart:convert';

import 'package:echo_store/entities/product.dart';
import 'package:echo_store/services/base.service.dart';

class ProductService extends BaseService {

  Future<List<Product>> getProductsAsync() async {
    var response = await getAsync("products");

    if(response.statusCode == 200){
      final body = json.decode(response.body);

      var products = List<Product>
        .from(body.map((product) => Product.fromJson(product)));

      return products;
    }

    return List.empty();
  }
}
