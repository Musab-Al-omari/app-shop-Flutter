import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:the_shop_flutter/providers/Cart_provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final String title;
  final quantity;
  CartItem(this.id, this.productId, this.title, this.quantity, this.price);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        child: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.onSurface,
          size: 40,
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: FittedBox(
                  child: Text(
                "\$ $price",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              )),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
