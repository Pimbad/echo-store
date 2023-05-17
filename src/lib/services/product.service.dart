import 'dart:convert';

import 'package:echo_store/entities/cart.product.dart';
import 'package:echo_store/entities/product.dart';
import 'package:echo_store/repository/product.repository.dart';
import 'package:echo_store/services/base.service.dart';

class ProductService extends BaseService {

  final ProductRepository _productRepository = ProductRepository();

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

  List<CartProduct> getCartProducts() {
    return _productRepository.getCartProducts();
  }

  void removeProductFromCart(int productId){
    var cartProducts = getCartProducts();

    var newCart = cartProducts
      .where((cp) => cp.product.id != productId)
      .toList();

    _productRepository.saveCartProducts(newCart);
  }

  void addProductToCart(int productId) async {
    var product = await getProductById(productId);

    var cartProducts = _productRepository.getCartProducts();

    if(cartProducts.isEmpty)
    {
      _createNewCart(product as Product);
      return;
    }

    var exists = cartProducts
      .where((cp) => cp.product.id == product?.id)
      .toList();

    if(exists.isNotEmpty)
    {
      _increaseCartProductCount(product as Product, cartProducts);
    }
    else
    {
      _addNewProductToCart(product as Product, cartProducts);
    }
  }

  void _addNewProductToCart(Product product, List<CartProduct> cartProducts){
    var cartProduct = CartProduct(1, product);
    cartProducts.add(cartProduct);

    _productRepository.saveCartProducts(cartProducts);
  }

  void _increaseCartProductCount(Product product, List<CartProduct> cartProducts)
  {
    for(var cartProduct in cartProducts)
    {
      if(cartProduct.product.id == product.id)
      {
        cartProduct.count++;
        break;
      }
    }

    _productRepository.saveCartProducts(cartProducts);
  }

  void _createNewCart(Product product){
    var newCart = <CartProduct>[
      CartProduct(1, product)
    ];

    _productRepository.saveCartProducts(newCart);
  }

  void finishOrder() => _productRepository.cleanCart();
}
