import 'dart:convert';

import 'package:echo_store/entities/cart.product.dart';
import 'package:localstorage/localstorage.dart';

class ProductRepository{
  static const String STORAGE_LABEL = "cart";
  static const String CART_PRODUCTS_TABLE = "cart_products"; 
  final LocalStorage storage = LocalStorage(STORAGE_LABEL);

    List<CartProduct> getCartProducts(){
      var cartProducts = storage.getItem(CART_PRODUCTS_TABLE);

      if(cartProducts == null){
        return List.empty();
      }

      var cartProductsDecode = json.decode(cartProducts);

      return List<CartProduct>.from(cartProductsDecode.map((cp)
        => CartProduct.fromJson(cp)));
    }

    void saveCartProducts(List<CartProduct> cartProducts) 
      => storage.setItem(CART_PRODUCTS_TABLE, jsonEncode(cartProducts));

    void cleanCart()
      => storage.setItem(CART_PRODUCTS_TABLE, null);

}