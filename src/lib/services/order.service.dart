import 'dart:convert';

import 'package:echo_store/entities/order.dart';
import 'package:echo_store/enums/api.enum.dart';
import 'package:echo_store/services/base.service.dart';

class OrderService extends BaseService {
  Future<Order?> finishOrder() async {
    var body = jsonEncode(<String, Object>{});

    var response = await postAsync("order/create-order", body, api: Api.echostore);

    if(response.statusCode == 201){
      final body = json.decode(response.body);

      print("order: "+ response.body);

      return Order.fromJson(body);
    }

    return null;
  }
}