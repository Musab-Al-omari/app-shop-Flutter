import 'package:flutter/material.dart';

import 'package:the_shop_flutter/models/Products.dart';

class ProductsOverView extends StatelessWidget {
  final List<Products> myProducts = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (ctx, index) => Text('data'));
  }
}
