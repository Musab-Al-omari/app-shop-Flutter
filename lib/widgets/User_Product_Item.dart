import 'package:flutter/material.dart';
import 'package:the_shop_flutter/providers/Products.dart';
import 'package:the_shop_flutter/providers/Products_provider.dart';
import 'package:the_shop_flutter/screens/Edit_Product_screen.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatefulWidget {
  String title;
  String imageUrl;
  String id;
  UserProductItem(this.title, this.imageUrl, this.id);

  @override
  State<UserProductItem> createState() => _UserProductItemState();
}

class _UserProductItemState extends State<UserProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.imageUrl),
        ),
        title: Text(widget.title),
        trailing: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      EditProductScreen.EditProductScreenRoute,
                      arguments: widget.id);
                },
                icon: Icon(Icons.edit),
                color: Theme.of(context).colorScheme.primary,
              ),
              IconButton(
                onPressed: () {
                  Provider.of<ProductProvider>(context, listen: false)
                      .deleteProduct(widget.id);
                },
                icon: Icon(Icons.delete),
                color: Theme.of(context).colorScheme.onError,
              )
            ],
          ),
        ),
      ),
    );
  }
}
