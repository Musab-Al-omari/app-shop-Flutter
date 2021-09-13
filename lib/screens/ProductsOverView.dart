import 'package:flutter/material.dart';

import 'package:the_shop_flutter/widgets/MyGridView.dart';

class ProductsOverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: MyGridView(),
    );
  }
}
