import 'package:flutter/material.dart';
import 'package:the_shop_flutter/providers/Order_Provider.dart';
import 'package:intl/intl.dart';

class OrderItems extends StatefulWidget {
  final OrderItem order;
  OrderItems(this.order);

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    print(widget.order);
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Row(children: [
              Chip(
                backgroundColor: Theme.of(context).colorScheme.surface,
                label: Text('\$ ${widget.order.amount}',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary)),
              ),
            ]),
            subtitle: Text(
              DateFormat('dd  / MM / yyyy   AT: hh:mm')
                  .format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListView(
                children: widget.order.orderProducts
                    .map((product) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${product.title}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.surface)),
                            Text('${product.quantity}x${product.price}',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.surface)),
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
