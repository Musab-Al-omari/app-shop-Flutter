import 'package:flutter/material.dart';
import 'package:the_shop_flutter/screens/Cart_screen.dart';
import 'package:the_shop_flutter/widgets/MyGridView.dart';
import 'package:the_shop_flutter/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_flutter/providers/Cart_provider.dart';

enum myfilter { all, favorite }

class ProductsOverView extends StatefulWidget {
  @override
  State<ProductsOverView> createState() => _ProductsOverViewState();
}

class _ProductsOverViewState extends State<ProductsOverView> {
  var isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (myfilter selectedValue) {
              setState(() {
                if (selectedValue == myfilter.favorite) {
                  isfavorite = true;
                } else {
                  isfavorite = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('only Favorites'),
                value: myfilter.favorite,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: myfilter.all,
              )
            ],
            icon: Icon(Icons.more_vert),
          ),
          Consumer<CartProvider>(
            builder: (cx, cart, _) => Badge(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.CartScreenRoute);
                },
                icon: Icon(Icons.shopping_cart),
              ),
              value: cart.cartCount.toString(),
            ),
          ),
        ],
      ),
      body: MyGridView(isfavorite),
    );
  }
}
