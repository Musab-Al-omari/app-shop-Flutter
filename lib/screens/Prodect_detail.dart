import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:the_shop_flutter/providers/Products_provider.dart';

class ProductDetail extends StatelessWidget {
  static String ProductDetailRoute = '/ProductDetailRoute';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<ProductProvider>(
      context,
      listen: false,
    ).oneProduct(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
