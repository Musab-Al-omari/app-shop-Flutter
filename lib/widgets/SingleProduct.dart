import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String id;
  final String title;
  final String image;

  SingleProduct(this.id, this.title, this.image);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
            ),
            onPressed: () {},
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          title: Text(
            title,
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
