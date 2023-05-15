import 'package:echo_store/entities/product.dart';
import 'package:echo_store/pages/home.page.dart';
import 'package:echo_store/services/product.service.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/utils/sizes.dart';
import 'package:echo_store/utils/toasts.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:echo_store/widgets/echo.home.header.widget.dart';
import 'package:echo_store/widgets/echo.page.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/echo.loading.widget.dart';

class ProductPage extends StatefulWidget {
  final int productId;

  const ProductPage({required this.productId, super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>{
  Product? _product;
  
  final NumberFormat _numberFormat = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

  final ProductService _productService = ProductService();

  void addProductToCart(){}

  void loadProductById(int productId) async {
    var product = await _productService.getProductById(productId);

    if(product == null) {
      Toasts.errorToast("Product not found, please try again later!");
    }
    else{
      setState(() {
        _product = product;
      });
    }
  }

  @override
  void initState() {
    loadProductById(super.widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
        EchoPage(
          Center(
            child: SizedBox(
              width: Sizes.getPercentWidth(context, 85),
              child: Column(children: [
                const EchoHomeHeader(
                  logout: false,
                  returnPage: HomePage(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _product == null 
                  ? const EchoLoading()
                  : SizedBox(
                    height: Sizes.getPercentHeight(context, 80),
                    width: Sizes.getPercentWidth(context, 85),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: Sizes.getPercentHeight(context, 40),
                              width: Sizes.getPercentWidth(context, 85),
                              decoration: BoxDecoration(
                                color: ColorPallete.cardBackgroundColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(25),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(_product?.imageUrl as String),
                                  )
                                ),
                              )
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "${_product?.rating.rate}/5 \n (${_product?.rating.count} avaliações)",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: ColorPallete.rateColor
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Text(
                                _product?.title as String,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: ColorPallete.darkFontColor
                                ),
                              )
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                _product?.category as String,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorPallete.fontColor
                                ),
                              )
                            ),

                            const Padding(
                              padding: EdgeInsets.only(top: 25, bottom: 25),
                              child: Divider(
                                height: 1,
                                thickness: .3,
                                color: ColorPallete.fontColor
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                _product?.description as String,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: ColorPallete.fontColor
                                ),
                              )
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: SizedBox(
                                width: Sizes.getPercentWidth(context, 45),
                                child: const Divider(
                                  height: 1,
                                  thickness: .3,
                                  color: ColorPallete.fontColor
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(
                                _numberFormat.format(_product?.price),
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: ColorPallete.backgroundColorLight
                                ),
                              )
                            ),

                            EchoButton(
                              text: "Adicionar ao Carrinho",
                              paddingTop: 50,
                              paddingBottom: 100,
                              width: Sizes.getPercentWidth(context, 35),
                              onPressed: addProductToCart,
                            ),
                          ],
                        )
                      )
                  )
                )
              ],
            )
          )
        ),
        percentHeightBody: 90,
        percentHeightOverlay: 10,
      )
    ); 
  }
}