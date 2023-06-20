import 'dart:convert';

import 'package:echo_store/entities/product.dart';
import 'package:echo_store/services/base.service.dart';

class CategoryService extends BaseService {
  Future<List<String>?> getCategoriesAsync() async {
    var response = await getAsync("products/categories");

    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    }

    return List.empty();
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    var response = await getAsync("products/category/$category");

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      return List<Product>.from(
          body.map((product) => Product.fromJson(product)));
    }

    return List.empty();
  }
}
