import 'dart:convert';

import 'package:echo_store/entities/cart.product.dart';
import 'package:echo_store/entities/product.dart';
import 'package:echo_store/enums/api.enum.dart';
import 'package:echo_store/services/base.service.dart';

class ProductService extends BaseService {
  Future<List<Product>> getProductsAsync() async {
    var response = await getAsync("products");

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      return List<Product>.from(
          body.map((product) => Product.fromJson(product)));
    }

    return List.empty();
  }

  Future<Product?> getProductById(int productId) async {
    var response = await getAsync("products/$productId");

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      return Product.fromJson(body);
    }

    return null;
  }

  Future<List<CartProduct>?> getCartProducts() async {
    var response = await getAsync("cart/get-cart-itens", api: Api.echostore);


    if(response.statusCode == 200){
      final body = json.decode(response.body);
      
      return List<CartProduct>.from(body.map((cartProduct)
        => CartProduct.fromJson(cartProduct)));
    }

    return null;
  }


  Future<bool> removeProductFromCart(int productId) async{
    var response = await deleteAsync("cart/delete-cart-item/$productId", api: Api.echostore);

    return response.statusCode == 202;
  }

  Future<bool> addProductToCart(int productId) async {
    var product = await getProductById(productId);

    var body = jsonEncode(<String, Object>{
      'id': product?.id as int,
      'title': product?.title as String,
      'price': product?.price as num,
      'description': product?.description as String,
      'category': product?.category as String,
      'image': product?.image as String,
      'rating': {'rate': product?.rating.rate, 'count': product?.rating.count}
    });

    var response = await postAsync("cart/add-to-cart", body, api: Api.echostore);

    return response.statusCode == 201;
  }
}
