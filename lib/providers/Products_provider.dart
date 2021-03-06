import 'package:flutter/foundation.dart';
import 'package:the_shop_flutter/providers/Products.dart';

class ProductProvider with ChangeNotifier {
  List<Products> _myProducts = [
    Products(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Products(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Products(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Products(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  List<Products> get myProducts {
    return [..._myProducts];
  }

  Products oneProduct(id) {
    return _myProducts.firstWhere((element) => element.id == id);
  }

  List<Products> get myFavoriteProducts {
    return _myProducts.where((product) => product.isfavorite == true).toList();
  }

  void addProduct(Products newProduct) {
    _myProducts.add(newProduct);
    notifyListeners();
  }

  void deleteProduct(id) {
    _myProducts.removeWhere((value) => value.id == id);
    notifyListeners();
  }

  bool checkProductId(String _id) {
    print('hello word');

    for (var i = 0; i < _myProducts.length; i++) {
      if (_myProducts[i].id == _id) {
        return true;
      }
    }
    return false;
  }

  void updateProduct(Products newProduct) {
    for (var i = 0; i < _myProducts.length; i++) {
      if (newProduct.id == _myProducts[i].id) {
        _myProducts[i] = newProduct;
        break;
      }
    }
    notifyListeners();
  }
}
