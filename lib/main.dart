import 'package:flutter/material.dart';
import 'package:the_shop_flutter/providers/Cart_provider.dart';
import 'package:the_shop_flutter/providers/Order_Provider.dart';
import 'package:the_shop_flutter/providers/Products_provider.dart';
import 'package:the_shop_flutter/screens/Cart_screen.dart';
import 'package:the_shop_flutter/screens/Edit_Product_screen.dart';
import 'package:the_shop_flutter/screens/Order_screen.dart';
import 'package:the_shop_flutter/screens/Prodect_detail.dart';
import 'package:the_shop_flutter/screens/ProductsOverView.dart';
import 'package:provider/provider.dart';
import 'package:the_shop_flutter/screens/User_Product_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrdersProvider(),
        )
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme(
                primary: Color.fromRGBO(194, 239, 179, 100),
                primaryVariant: Color.fromRGBO(194, 239, 179, 100),
                secondary: Color.fromRGBO(116, 111, 114, 100),
                secondaryVariant: Color.fromRGBO(116, 111, 114, 100),
                surface: Color.fromRGBO(89, 74, 38, 100),
                background: Color.fromRGBO(151, 171, 177, 100),
                error: Color.fromRGBO(89, 74, 38, 100),
                onPrimary: Color.fromRGBO(115, 95, 61, 100),
                onSecondary: Color.fromRGBO(194, 239, 179, 100),
                onSurface: Color.fromRGBO(194, 239, 179, 100),
                onBackground: Color.fromRGBO(115, 95, 61, 100),
                onError: Colors.red,
                brightness: Brightness.light)),
        home: ProductsOverView(),
        routes: {
          ProductDetail.ProductDetailRoute: (context) => ProductDetail(),
          CartScreen.CartScreenRoute: (context) => CartScreen(),
          OrderScreen.OrderScreenRoutes: (context) => OrderScreen(),
          UserProductScreen.UserProductScreenRoute: (context) =>
              UserProductScreen(),
          EditProductScreen.EditProductScreenRoute: (context) =>
              EditProductScreen(),
        },
      ),
    );
  }
}
