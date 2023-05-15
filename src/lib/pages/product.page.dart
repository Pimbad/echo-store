import 'package:echo_store/entities/product.dart';
import 'package:echo_store/entities/product.rate.dart';
import 'package:echo_store/pages/home.page.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/utils/sizes.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:echo_store/widgets/echo.home.header.widget.dart';
import 'package:echo_store/widgets/echo.page.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/echo.loading.widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>{
  NumberFormat numberFormat = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  Product? product;

  void addProductToCart(){}

  @override
  void initState() {
    var rate = ProductRate(50, 5);
    product = Product(
      1,
      "Jetta GLI 2023 2.0 Turbo 16v DSG",
      145000,
      "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
      "Sedans",
      "https://static.wixstatic.com/media/ef89cc_3a2317a71f8749f9a65d5831ab894aea~mv2.png/v1/fill/w_489,h_360,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c7fb0cf09a2643657c8b5cbf58586d60.png",
      rate);

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
                child: product == null 
                ? const EchoLoading()
                : SizedBox(
                    child: Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.fill,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(product?.imageUrl as String),
                          )
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            product?.title as String,
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
                            product?.category as String,
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
                            product?.description as String,
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
                            numberFormat.format(product?.price),
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
                          paddingTop: 65,
                          width: Sizes.getPercentWidth(context, 35),
                          onPressed: addProductToCart,
                        ),
                      ],
                    )
                )
              )
            ],
          )
        )
      ),
      percentHeightBody: 90,
      percentHeightOverlay: 10,
    )); 
  }
}