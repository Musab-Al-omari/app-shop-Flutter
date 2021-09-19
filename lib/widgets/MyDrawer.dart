import 'package:flutter/material.dart';
import 'package:the_shop_flutter/screens/Order_screen.dart';
import 'package:the_shop_flutter/screens/User_Product_Screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('hello'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            title: Text('Shop'),
            leading: Icon(Icons.shop),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            title: Text('Orders'),
            leading: Icon(Icons.payment),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrderScreen.OrderScreenRoutes);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Mange My Product'),
            leading: Icon(Icons.edit),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                  UserProductScreen.UserProductScreenRoute);
            },
          ),
        ],
      ),
    );
  }
}
