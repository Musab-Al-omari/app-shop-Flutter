import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String description;
  bool isfavorite;

  Products(
      {required this.id,
      required this.description,
      required this.imageUrl,
      this.isfavorite = false,
      required this.price,
      required this.title});

  void ToggleIsFavorite() {
    isfavorite = !isfavorite;
    notifyListeners();
  }
}
