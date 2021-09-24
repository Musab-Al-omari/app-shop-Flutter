import 'package:flutter/material.dart';
import 'package:the_shop_flutter/providers/Products_provider.dart';
import 'package:the_shop_flutter/screens/Edit_Product_screen.dart';
import 'package:the_shop_flutter/widgets/MyDrawer.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_flutter/widgets/User_Product_Item.dart';

class UserProductScreen extends StatelessWidget {
  static String UserProductScreenRoute = '/UserProductScreen';
  @override
  Widget build(BuildContext context) {
    final productDate = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Product'),
        actions: [
          IconButton(
              iconSize: 40,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.EditProductScreenRoute);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: productDate.myProducts.length,
        itemBuilder: (context, index) => Column(children: [
          UserProductItem(
            productDate.myProducts[index].title,
            productDate.myProducts[index].imageUrl,
            productDate.myProducts[index].id,
          ),
          Divider()
        ]),
      ),
    );
  }
}
