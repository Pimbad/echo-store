import 'package:echo_store/pages/home.page.dart';
import 'package:echo_store/pages/product.bycategory.page.dart';
import 'package:echo_store/router/router.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/utils/sizes.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:echo_store/widgets/echo.home.header.widget.dart';
import 'package:echo_store/widgets/echo.loading.widget.dart';
import 'package:echo_store/widgets/echo.page.widget.dart';
import 'package:echo_store/entities/product.dart';
import 'package:flutter/material.dart';

import '../services/category.service.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> _categories = List.empty();
  bool _loadingCategories = true;
  final CategoryService _categoryService = CategoryService();

  Future<void> productsBycatgoryPage(String category) async {
    var productsBycategory =
        await _categoryService.getProductsByCategory(category);

    pushproductsBycatgoryPage(productsBycategory);
  }

  void pushproductsBycatgoryPage(List<Product> productsBycategory) {
    EchoRouter.push(ProductByCategoryPage(productsBycategory), context);
  }

  void loadCategories() async {
    var categories = await _categoryService.getCategoriesAsync();

    if (categories!.isNotEmpty) {
      setState(() {
        _categories = categories;
      });
    }

    setState(() {
      _loadingCategories = false;
    });
  }

  @override
  void initState() {
    loadCategories();
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
                  _loadingCategories
                      ? const EchoLoading()
                      : Container(
                          height: Sizes.getPercentHeight(context, 55),
                          decoration: BoxDecoration(
                            color: ColorPallete.cardBackgroundColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: _categories.isEmpty
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 40),
                                  child: Text(
                                      "Não foi possível carregar as categorias! Tente novamente mais tarde.",
                                      textAlign: TextAlign.center),
                                )
                              : ListView.builder(
                                  itemCount: _categories.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Column(children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: EchoButton(
                                                  text: _categories[index],
                                                  height: 50,
                                                  onPressed: (() =>
                                                      productsBycatgoryPage(
                                                          _categories[index]))))
                                        ]));
                                  }))
                ])))));
  }
}
