import 'package:echo_store/entities/order.dart';
import 'package:echo_store/pages/historic.page.dart';
import 'package:echo_store/pages/home.page.dart';
import 'package:echo_store/router/router.dart';
import 'package:echo_store/utils/color.pallete.dart';
import 'package:echo_store/widgets/echo.button.widget.dart';
import 'package:echo_store/widgets/echo.page.widget.dart';
import 'package:flutter/material.dart';

import '../utils/sizes.dart';
import '../widgets/echo.home.header.widget.dart';

class FinishPage extends StatefulWidget {
  final Order _order;

  const FinishPage(this._order, {super.key});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  @override
  void initState() {
    super.initState();
  }

  void pushOrdersPage() => EchoRouter.push(const HistoricPage(), context);

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
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: const TextStyle(
                              color: ColorPallete.backgroundColorLight,
                              fontSize: 22,
                            ),
                            children: [
                              const TextSpan(text: "Seu pedido \n "),
                              TextSpan(
                                  text: "#${widget._order.id} \n",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorPallete.backgroundColor,
                                    fontSize: 26,
                                  )),
                              const TextSpan(text: "foi realizado com sucesso!")
                            ])),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: EchoButton(
                          text: "Ver pedidos",
                          height: 50,
                          onPressed: pushOrdersPage))
                ])))));
  }
}
