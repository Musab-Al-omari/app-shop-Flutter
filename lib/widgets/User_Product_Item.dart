import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  String title;
  String imageUrl;

  UserProductItem(this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(title),
        trailing: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
                color: Theme.of(context).colorScheme.primary,
              ),
              IconButton(
                onPressed: () {},
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
