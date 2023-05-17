import 'package:echo_store/entities/cart.product.dart';
import 'package:echo_store/pages/finish.page.dart';
import 'package:echo_store/pages/home.page.dart';
import 'package:echo_store/router/router.dart';
import 'package:echo_store/services/product.service.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/utils/sizes.dart';
import 'package:echo_store/utils/toasts.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:echo_store/widgets/echo.home.header.widget.dart';
import 'package:echo_store/widgets/echo.loading.widget.dart';
import 'package:echo_store/widgets/echo.page.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>{
  List<CartProduct> _cartProducts = List.empty();
  double _cartPrice = 0;
  bool _loadingProducts = true;

  final ProductService _productService = ProductService();
  final NumberFormat _numberFormat = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

  void finishOrder() {
    _productService.finishOrder();
    EchoRouter.push(const FinishPage(), context);
  }

  void calculateProductsPrice() {
    double cartPrice = 0;

    for (var cartProduct in _cartProducts) { 
      cartPrice += cartProduct.product.price * cartProduct.count;
    }

    setState(() {
      _cartPrice = cartPrice;
    });
  }

  void removeProductFromCart(int productId, String productTitle){
    _productService.removeProductFromCart(productId);
    Toasts.warningToast("O produto $productTitle foi removido do carrinho!");

    EchoRouter.pushReplacement(const CartPage(), context);
  }

  void loadProducts() {
    var cartProducts = _productService.getCartProducts();
    
    if(cartProducts.isNotEmpty)
    {
      setState(() {
        _cartProducts = cartProducts;
      });

      calculateProductsPrice();
    }

    setState(() {
      _loadingProducts = false;
    });
  }

  @override
  void initState() {
    loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
        EchoPage(
          Center(
            child: SizedBox(
              height: Sizes.getPercentHeight(context, 75),
              width: Sizes.getPercentWidth(context, 85),
              child: Column(children: [
                const EchoHomeHeader(
                  logout: false,
                  cart: false,
                  returnPage: HomePage(),
                ),

                _loadingProducts
                ? const EchoLoading()
                : SizedBox(
                  height: Sizes.getPercentHeight(context, 56),
                  width: Sizes.getPercentWidth(context, 85),
                  child: _cartProducts.isEmpty
                  ? const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "Seu carrinho está vazio!",
                      textAlign: TextAlign.center),
                    ) 
                  
                  : ListView.builder(
                    itemCount: _cartProducts.length,
                    itemBuilder: (BuildContext context, int index){
                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          height: Sizes.getPercentHeight(context, 55),
                          decoration: BoxDecoration(
                            color: ColorPallete.cardBackgroundColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: SizedBox(
                                  width: Sizes.getPercentWidth(context, 35),
                                  height: Sizes.getPercentHeight(context, 20),
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        _cartProducts[index].product.image),
                                        )
                                      )
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: SizedBox(
                                      width: Sizes.getPercentWidth(context, 70),
                                      height: Sizes.getPercentHeight(context, 26),
                                      child: Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                            child: Text(_cartProducts[index].product.title,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: ColorPallete.fontColor,
                                              fontSize: 14)
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(top: 15),
                                            child: Text(
                                              "R\$ ${_cartProducts[index].product.price}",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: ColorPallete.backgroundColor,
                                                fontWeight:FontWeight.bold,
                                                fontSize: 20)
                                                ),
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(top: 15, bottom: 5),
                                              child: Text("Quantidade: ${_cartProducts[index].count}")
                                            ),
                                                
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: EchoButton(
                                                text: "Remover do carrinho",
                                                  paddingTop: 25,
                                                  paddingBottom: 0,
                                                  paddingLeft: 0,
                                                  paddingRight: 0,
                                                  height: 40,
                                                  onPressed: () => removeProductFromCart(_cartProducts[index].product.id, _cartProducts[index].product.title),
                                              ),
                                            )
                                          ]
                                        ),
                                      )
                                    ),
                                  ],
                                )
                              )
                            );
                    }
                  )
                ),

                _loadingProducts || _cartProducts.isEmpty
                ? const SizedBox.shrink()
                : SizedBox(
                  height: Sizes.getPercentHeight(context, 10),
                  width: Sizes.getPercentWidth(context, 85),
                  child: Row(
                    children: [
                      SizedBox(
                        height: Sizes.getPercentHeight(context, 10),
                        width: Sizes.getPercentWidth(context, 42.5),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: const TextStyle(
                                color: ColorPallete.fontColor,
                                fontSize: 20,
                              ),
                              children: [
                                const TextSpan(text: "Total: \n"),
                                TextSpan(
                                  text: _numberFormat.format(_cartPrice),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold
                                  ))
                              ]
                            ) 
                          ),
                        )
                      ),

                      SizedBox(
                        height: 65,
                        width: Sizes.getPercentWidth(context, 42.5),
                        child: EchoButton(
                          text: "Finalizar Pedido",
                          paddingTop: 15,
                          width: 90,
                          height: 10,
                          onPressed: finishOrder,
                        ),
                      )
                    ],
                  ),    
                )
              ])
            )
          )
        )
      );
  }
}