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

class ProductByCategoryPage extends StatefulWidget {
  final List<Product> _productList;

  const ProductByCategoryPage(this._productList, {super.key});

  @override
  State<ProductByCategoryPage> createState() => _ProductByCategoryPageState();
}

class _ProductByCategoryPageState extends State<ProductByCategoryPage> {
  final NumberFormat _numberFormat =
      NumberFormat.currency(locale: "pt_BR", symbol: "R\$");

  final ProductService _productService = ProductService();

  Future<void> addProductToCart(int productId, String productTitle) async {
    await _productService.addProductToCart(productId);
    Toasts.messageToast("O produto $productTitle foi adicionado ao carrinho!");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EchoPage(Center(
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
                          itemCount: widget._productList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                    height: Sizes.getPercentHeight(context, 55),
                                    decoration: BoxDecoration(
                                      color: ColorPallete.cardBackgroundColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: SingleChildScrollView(
                                        child: Column(
                                      children: [
                                        Container(
                                            height: Sizes.getPercentHeight(
                                                context, 40),
                                            width: Sizes.getPercentWidth(
                                                context, 85),
                                            decoration: BoxDecoration(
                                              color: ColorPallete
                                                  .cardBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(25),
                                              child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(widget
                                                        ._productList[index]
                                                        .image),
                                                  )),
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            "${widget._productList[index].rating.rate}/5 \n (${widget._productList[index].rating.count} avaliações)",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: ColorPallete.rateColor),
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: Text(
                                              widget._productList[index].title,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorPallete
                                                      .darkFontColor),
                                            )),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              widget
                                                  ._productList[index].category,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      ColorPallete.fontColor),
                                            )),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              top: 25, bottom: 25),
                                          child: Divider(
                                              height: 1,
                                              thickness: .3,
                                              color: ColorPallete.fontColor),
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              widget._productList[index]
                                                  .description,
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      ColorPallete.fontColor),
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 40),
                                          child: SizedBox(
                                            width: Sizes.getPercentWidth(
                                                context, 45),
                                            child: const Divider(
                                                height: 1,
                                                thickness: .3,
                                                color: ColorPallete.fontColor),
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 15),
                                            child: Text(
                                              _numberFormat.format(widget
                                                  ._productList[index].price),
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorPallete
                                                      .backgroundColorLight),
                                            )),
                                        EchoButton(
                                          text: "Adicionar ao Carrinho",
                                          paddingTop: 50,
                                          paddingBottom: 100,
                                          width: Sizes.getPercentWidth(
                                              context, 43),
                                          onPressed: () => addProductToCart(
                                              widget._productList[index].id,
                                              widget._productList[index].title),
                                        ),
                                      ],
                                    ))));
                          }))
                ])))));
  }
}
