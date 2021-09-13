import 'package:flutter/material.dart';
import 'package:the_shop_flutter/providers/Products_provider.dart';
import 'package:the_shop_flutter/screens/Prodect_detail.dart';
import 'package:the_shop_flutter/screens/ProductsOverView.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme(
                primary: Color.fromRGBO(194, 239, 179, 100),
                primaryVariant: Color.fromRGBO(194, 239, 179, 100),
                secondary: Color.fromRGBO(116, 111, 114, 100),
                secondaryVariant: Color.fromRGBO(116, 111, 114, 100),
                surface: Color.fromRGBO(194, 239, 179, 100),
                background: Color.fromRGBO(151, 171, 177, 100),
                error: Color.fromRGBO(89, 74, 38, 100),
                onPrimary: Color.fromRGBO(115, 95, 61, 100),
                onSecondary: Color.fromRGBO(194, 239, 179, 100),
                onSurface: Color.fromRGBO(194, 239, 179, 100),
                onBackground: Color.fromRGBO(115, 95, 61, 100),
                onError: Color.fromRGBO(89, 74, 38, 100),
                brightness: Brightness.light)),
        home: ProductsOverView(),
        routes: {
          ProductDetail.ProductDetailRoute: (context) => ProductDetail(),
        },
      ),
    );
  }
}
