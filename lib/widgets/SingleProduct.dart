import 'package:flutter/material.dart';
import 'package:the_shop_flutter/providers/Cart_provider.dart';
import 'package:the_shop_flutter/providers/Products.dart';
import 'package:the_shop_flutter/screens/Prodect_detail.dart';
import 'package:provider/provider.dart';

class SingleProduct extends StatelessWidget {
  // final String id;
  // final String title;
  // final String image;

  // SingleProduct(this.id, this.title, this.image);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(ProductDetail.ProductDetailRoute, arguments: product.id),
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Color.fromRGBO(194, 239, 179, 60),
            leading: Consumer<Products>(
                builder: (context, product, _) => IconButton(
                      icon: Icon(
                        product.isfavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                      onPressed: () {
                        product.ToggleIsFavorite();
                      },
                      color: Theme.of(context).colorScheme.surface,
                    )),
            title: Text(
              product.title,
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }
}
