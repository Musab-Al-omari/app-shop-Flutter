import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:the_shop_flutter/providers/Products_provider.dart';

import 'package:the_shop_flutter/widgets/SingleProduct.dart';

class MyGridView extends StatelessWidget {
  var isfavorte;
  MyGridView(this.isfavorte);

  @override
  Widget build(BuildContext context) {
    final myProducts = isfavorte
        ? Provider.of<ProductProvider>(context).myProducts
        : Provider.of<ProductProvider>(context).myFavoriteProducts;
    return GridView.builder(
      padding: EdgeInsets.all(7),
      itemCount: myProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: myProducts[index],
        child: SingleProduct(
            // myProducts[index].id,
            // myProducts[index].title,
            // myProducts[index].imageUrl,
            ),
      ),
    );
  }
}
