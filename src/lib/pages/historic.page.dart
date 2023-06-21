import 'package:echo_store/entities/order.dart';
import 'package:echo_store/pages/home.page.dart';
import 'package:echo_store/services/order.service.dart';
import 'package:echo_store/widgets/echo.loading.widget.dart';
import 'package:echo_store/widgets/echo.page.widget.dart';
import 'package:flutter/material.dart';

import '../utils/sizes.dart';
import '../widgets/echo.home.header.widget.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  List<Order> _orders = List.empty();
  final OrderService _orderService = OrderService();

  void loadOrders() async {
    var orders = await _orderService.getOrders();

    if (orders.isNotEmpty) {
      setState(() {
        _orders = orders;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EchoPage(
        Padding(
          padding: EdgeInsets.all(Sizes.getPercentWidth(context, 5)),
          child: Column(
            children: [
              const EchoHomeHeader(
                logout: false,
                cart: false,
                returnPage: HomePage(),
              ),
              SingleChildScrollView(
                  child: ListView.builder(
                      shrinkWrap: false,
                      itemCount: _orders.length,
                      itemBuilder: (BuildContext context, int index) {
                        final order = _orders[index];
                        return Card(
                            elevation: 2,
                            child: ListTile(
                                title: Text('Pedido: #${order.id}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 119, 33, 26))),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Text(${order.date.toString()}),
                                    const Text(
                                      '20/06/2023',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text('Carrinho'),
                                    Column(
                                      children: order.itens.map((cartProduct) {
                                        return ListTile(
                                          title:
                                              Text(cartProduct.product.title),
                                          leading: Image.network(
                                              cartProduct.product.image),
                                          subtitle: Text(
                                              'Quantidade: ${cartProduct.count}'),
                                        );
                                      }).toList(),
                                    ),
                                    Text(
                                        'Total da Compra: R\$ ${order.price.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: Color.fromARGB(255, 34, 3, 1),
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                )));
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
