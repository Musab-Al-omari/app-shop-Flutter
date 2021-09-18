import 'package:flutter/foundation.dart';
import 'package:the_shop_flutter/providers/Cart_provider.dart';
import 'package:the_shop_flutter/widgets/Cart_item.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItems> orderProducts;
  final DateTime dateTime;
  OrderItem({
    required this.id,
    required this.amount,
    required this.dateTime,
    required this.orderProducts,
  });
}

class OrdersProvider with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItems> myCartItem, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            orderProducts: myCartItem));

    notifyListeners();
  }
}
