import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:the_shop_flutter/providers/Products_provider.dart';
import 'package:the_shop_flutter/screens/Prodect_detail.dart';
import 'package:the_shop_flutter/widgets/SingleProduct.dart';

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myProducts = Provider.of<ProductProvider>(context).myProducts;
    return GridView.builder(
      padding: EdgeInsets.all(7),
      itemCount: myProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7),
      itemBuilder: (ctx, index) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
            ProductDetail.ProductDetailRoute,
            arguments: myProducts[index].id),
        child: SingleProduct(
          myProducts[index].id,
          myProducts[index].title,
          myProducts[index].imageUrl,
        ),
      ),
    );
  }
}
