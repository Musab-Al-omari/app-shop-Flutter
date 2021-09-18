import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_flutter/providers/Order_Provider.dart';
import 'package:the_shop_flutter/widgets/MyDrawer.dart';
import 'package:the_shop_flutter/widgets/Order_items.dart';

class OrderScreen extends StatelessWidget {
  static String OrderScreenRoutes = '/OrderScreen';
  @override
  Widget build(BuildContext context) {
    final myOrders = Provider.of<OrdersProvider>(context);
    print('myOrders');
    print(myOrders.orders);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: myOrders.orders.length,
        itemBuilder: (context, index) => OrderItems(myOrders.orders[index]),
      ),
    );
  }
}
