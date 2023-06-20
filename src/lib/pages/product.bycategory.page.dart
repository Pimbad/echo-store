import 'package:echo_store/entities/product.dart';
import 'package:echo_store/pages/home.page.dart';
import 'package:echo_store/pages/product.page.dart';
import 'package:echo_store/services/product.service.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/utils/sizes.dart';
import 'package:echo_store/utils/toasts.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:echo_store/widgets/echo.home.header.widget.dart';
import 'package:echo_store/widgets/echo.page.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../router/router.dart';
import '../widgets/echo.loading.widget.dart';
import 'category.page.dart';

class ProductByCategoryPage extends StatefulWidget {
  final List<Product> _productList;

  const ProductByCategoryPage(this._productList, {super.key});

  @override
  State<ProductByCategoryPage> createState() => _ProductByCategoryPageState();
}

class _ProductByCategoryPageState extends State<ProductByCategoryPage> {
  final ProductService _productService = ProductService();

  Future<void> addProductToCart(int productId, String productTitle) async {
    await _productService.addProductToCart(productId);

    Toasts.messageToast("O produto $productTitle foi adicionado ao carrinho!");
  }

  void pushProductDetailPage(int productId) =>
      EchoRouter.push(ProductPage(productId: productId), context);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EchoPage(Center(
            child: SizedBox(
                width: Sizes.getPercentWidth(context, 85),
                child: Column(children: [
                  SizedBox(
                      child: Column(children: [
                    const EchoHomeHeader(
                      logout: false,
                      cart: false,
                      returnPage: CategoryPage(),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: widget._productList.isEmpty
                            ? const EchoLoading()
                            : SizedBox(
                                width: Sizes.getPercentWidth(context, 85),
                                height: Sizes.getPercentHeight(context, 65),
                                child: ListView.builder(
                                    itemCount: widget._productList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Container(
                                              height: Sizes.getPercentHeight(
                                                  context, 60),
                                              width: Sizes.getPercentWidth(
                                                  context, 60),
                                              decoration: BoxDecoration(
                                                color: ColorPallete
                                                    .cardBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 40),
                                                    child: SizedBox(
                                                        width: Sizes
                                                            .getPercentWidth(
                                                                context, 35),
                                                        height: Sizes
                                                            .getPercentHeight(
                                                                context, 20),
                                                        child: FittedBox(
                                                            fit: BoxFit.fill,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              child: Image
                                                                  .network(widget
                                                                      ._productList[
                                                                          index]
                                                                      .image),
                                                            ))),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 25),
                                                      child: SizedBox(
                                                        width: Sizes
                                                            .getPercentWidth(
                                                                context, 70),
                                                        height: Sizes
                                                            .getPercentHeight(
                                                                context, 28),
                                                        child:
                                                            Column(children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 20),
                                                            child: Text(
                                                                widget
                                                                    ._productList[
                                                                        index]
                                                                    .title,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: const TextStyle(
                                                                    color: ColorPallete
                                                                        .fontColor,
                                                                    fontSize:
                                                                        14)),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 15),
                                                            child: Text(
                                                                "R\$ ${widget._productList[index].price}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: const TextStyle(
                                                                    color: ColorPallete
                                                                        .backgroundColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        20)),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 30),
                                                            child: EchoButton(
                                                              text: "Ver",
                                                              height: 40,
                                                              paddingTop: 5,
                                                              paddingBottom: 0,
                                                              paddingLeft: 0,
                                                              paddingRight: 0,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              fontColor:
                                                                  ColorPallete
                                                                      .backgroundColorLight,
                                                              onPressed: () =>
                                                                  pushProductDetailPage(widget
                                                                      ._productList[
                                                                          index]
                                                                      .id),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 10),
                                                            child: EchoButton(
                                                              text:
                                                                  "Adicionar ao carrinho",
                                                              paddingTop: 5,
                                                              paddingBottom: 0,
                                                              paddingLeft: 0,
                                                              paddingRight: 0,
                                                              height: 45,
                                                              onPressed: () => addProductToCart(
                                                                  widget
                                                                      ._productList[
                                                                          index]
                                                                      .id,
                                                                  widget
                                                                      ._productList[
                                                                          index]
                                                                      .title),
                                                            ),
                                                          )
                                                        ]),
                                                      )),
                                                ],
                                              )));
                                    }))),
                  ]))
                ])))));
  }
}
