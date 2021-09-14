import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_flutter/providers/Cart_provider.dart';
import 'package:the_shop_flutter/widgets/Cart_item.dart';

class CartScreen extends StatelessWidget {
  static String CartScreenRoute = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    Map<String, CartItems> myCartItems = cart.myCartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total :',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$ ${cart.totalAmount.toString()}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Order Now',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Expanded(
            child: ListView.builder(
                itemCount: myCartItems.length,
                itemBuilder: (ctx, i) => CartItem(
                    myCartItems.values.toList()[i].id,
                    myCartItems.keys.toList()[i],
                    myCartItems.values.toList()[i].title,
                    myCartItems.values.toList()[i].quantity,
                    myCartItems.values.toList()[i].price)),
          )
        ],
      ),
    );
  }
}
