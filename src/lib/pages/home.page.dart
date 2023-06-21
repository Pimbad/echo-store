import 'package:echo_store/entities/product.dart';
import 'package:echo_store/pages/login.page.dart';
import 'package:echo_store/pages/product.page.dart';
import 'package:echo_store/router/router.dart';
import 'package:echo_store/services/product.service.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/utils/sizes.dart';
import 'package:echo_store/utils/toasts.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:echo_store/widgets/echo.home.header.widget.dart';
import 'package:echo_store/widgets/echo.input.widget.dart';
import 'package:echo_store/widgets/echo.loading.widget.dart';
import 'package:echo_store/widgets/echo.page.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Product> _filteredProducts = List.empty();
  TextEditingController searchController = TextEditingController();
  final ProductService _productService = ProductService();

  List<Product> _products = List.empty();

  void pushCartPage() => EchoRouter.pushReplacement(const LoginPage(), context);

  void pushProductDetailPage(int productId) =>
      EchoRouter.push(ProductPage(productId: productId), context);

  void logout() {
    EchoRouter.pushReplacement(const LoginPage(), context);
  }

  void loadProducts() async {
    var products = await _productService.getProductsAsync();

    if (products.isEmpty) {
      Toasts.errorToast(
          "Não foi possível encontrar os produtos, tente novamente mais tarde!");
    } else {
      setState(() {
        _products = products;
        _filteredProducts = _products;
      });
    }
  }

  void filterProducts(String searchTerm) {
    List<Product> results = [];

    if (searchTerm.isNotEmpty) {
      results = _products
          .where((product) =>
              product.title.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    } else {
      results = _products;
    }

    setState(() {
      _filteredProducts = results;
    });
  }

  Future<void> addProductToCart(int productId, String productTitle) async {
    await _productService.addProductToCart(productId);

    Toasts.messageToast("O produto $productTitle foi adicionado ao carrinho!");
  }

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EchoPage(
      SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(Sizes.getPercentWidth(context, 5)),
              child: Column(
                children: [
                  const EchoHomeHeader(),
                  Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          filterProducts(value);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Pesquise seu intrumento musical...',
                          prefixIcon: Icon(Icons.search),
                        ),
                      )),
                  SizedBox(
                    width: Sizes.getPercentWidth(context, 100),
                    height: Sizes.getPercentHeight(context, 10),
                    child: Expanded(
                        child: ListView.separated(
                            itemCount: _filteredProducts.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                height: 1,
                                color: Colors.grey,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              final product = _filteredProducts[index];
                              return ListTile(
                                leading: Image.network(product.image),
                                title: Text(product.title),
                                subtitle: Text(product.description),
                                onTap: () {
                                  pushProductDetailPage(product.id);
                                },
                              );
                            })),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: _products.isEmpty
                          ? const EchoLoading()
                          : SizedBox(
                              width: Sizes.getPercentWidth(context, 85),
                              height: Sizes.getPercentHeight(context, 65),
                              child: ListView.builder(
                                  itemCount: _products.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Container(
                                            height: Sizes.getPercentHeight(
                                                context, 57),
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
                                                      width:
                                                          Sizes.getPercentWidth(
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
                                                            child: Image.network(
                                                                _products[index]
                                                                    .image),
                                                          ))),
                                                ),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 25),
                                                    child: SizedBox(
                                                      width:
                                                          Sizes.getPercentWidth(
                                                              context, 70),
                                                      height: Sizes
                                                          .getPercentHeight(
                                                              context, 28),
                                                      child: Column(children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 20),
                                                          child: Text(
                                                              _products[index]
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
                                                              "R\$ ${_products[index].price}",
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
                                                            fontColor: ColorPallete
                                                                .backgroundColorLight,
                                                            onPressed: () =>
                                                                pushProductDetailPage(
                                                                    _products[
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
                                                            height: 40,
                                                            onPressed: () =>
                                                                addProductToCart(
                                                                    _products[
                                                                            index]
                                                                        .id,
                                                                    _products[
                                                                            index]
                                                                        .title),
                                                          ),
                                                        )
                                                      ]),
                                                    )),
                                              ],
                                            )));
                                  })))
                ],
              ))),
      percentHeightBody: 90,
      percentHeightOverlay: 10,
    ));
  }
}
