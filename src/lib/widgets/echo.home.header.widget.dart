import 'package:echo_store/pages/cart.page.dart';
import 'package:echo_store/pages/category.page.dart';
import 'package:echo_store/pages/historic.page.dart';
import 'package:echo_store/pages/login.page.dart';
import 'package:echo_store/router/router.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:flutter/material.dart';

class EchoHomeHeader extends StatelessWidget {
  final StatefulWidget? returnPage;
  final bool logout;
  final bool cart;

  const EchoHomeHeader(
      {this.returnPage, this.cart = true, this.logout = true, super.key});

  void pushReturnPage(context) =>
      EchoRouter.pushReplacement(returnPage as StatefulWidget, context);

  void _pushCartPage(context) =>
      EchoRouter.pushReplacement(const CartPage(), context);

  void _pushHistoricPage(context) =>
      EchoRouter.pushReplacement(const HistoricPage(), context);

  void _pushCategoryPage(context) =>
      EchoRouter.pushReplacement(const CategoryPage(), context);

  void _logout(context) {
    EchoRouter.pushReplacement(const LoginPage(), context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      icon: Icon(logout ? Icons.logout : Icons.arrow_back_sharp,
                          color: ColorPallete.backgroundColorLight, size: 30),
                      alignment: Alignment.centerLeft,
                      onPressed: logout
                          ? () => _logout(context)
                          : () => pushReturnPage(context)),
                  IconButton(
                      icon: const Icon(Icons.category,
                          color: ColorPallete.backgroundColorLight, size: 30),
                      alignment: Alignment.centerRight,
                      onPressed: () => _pushCategoryPage(context)),
                  IconButton(
                      icon: const Icon(Icons.history,
                          color: ColorPallete.backgroundColorLight, size: 30),
                      alignment: Alignment.centerRight,
                      onPressed: () => _pushHistoricPage(context)),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart,
                        color: ColorPallete.backgroundColorLight, size: 30),
                    alignment: Alignment.centerRight,
                    onPressed: () => _pushCartPage(context),
                  )
                ])));
  }
}
