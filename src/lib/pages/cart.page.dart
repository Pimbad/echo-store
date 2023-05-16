import 'package:echo_store/entities/product.dart';
import 'package:echo_store/pages/home.page.dart';
import 'package:echo_store/services/product.service.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/utils/sizes.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:echo_store/widgets/echo.home.header.widget.dart';
import 'package:echo_store/widgets/echo.page.widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>{
  List<Product> _cartProducts = List.empty();

  final ProductService _productService = ProductService();

  void loadProducts() async {
    var prds = await _productService.getProductsAsync();

    print(prds);

    setState(() {
      _cartProducts = prds;
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

                SizedBox(
                  height: Sizes.getPercentHeight(context, 56),
                  width: Sizes.getPercentWidth(context, 85),
                  child: ListView.builder(
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
                                        _cartProducts[index].imageUrl),
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
                                            child: Text(_cartProducts[index].title,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: ColorPallete.fontColor,
                                              fontSize: 14)
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(top: 15),
                                            child: Text(
                                              "R\$ ${_cartProducts[index].price}",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: ColorPallete.backgroundColor,
                                                fontWeight:FontWeight.bold,
                                                fontSize: 20)
                                                ),
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(top: 15, bottom: 5),
                                              child: Text("Quantidade: 1")
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
                                                  onPressed: () {},
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

                Container(
                    height: Sizes.getPercentHeight(context, 10),
                    width: Sizes.getPercentWidth(context, 85),
                    decoration: BoxDecoration(color: Colors.blue),
                  )
              ])
            )
          )
        )
      );
  }
}