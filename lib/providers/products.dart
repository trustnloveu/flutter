import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Models
import 'package:shop_app/providers/product.dart';

class Products with ChangeNotifier {
  // data-set of products in array
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // Getter // ! To avoid direct access to the poitner
  List<Product> get items {
    return [..._items];
  }

  // Getter
  List<Product> get favoritesItems {
    return _items.where((item) => item.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  // Post
  Future<void> addProduct(Product product) {
    final url = Uri.parse(
        'https://flutter-shop-app-e61d9-default-rtdb.asia-southeast1.firebasedatabase.app/products.json');
    return http
        .post(
      url,
      body: json.encode(
        {
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavorite': product.isFavorite,
        },
      ),
    )
        .then(
      (response) {
        final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
        );
        _items.add(newProduct);
        // _items.insert(0, newProduct);

        notifyListeners();
      },
    ).catchError(
      (error) {
        print(error);
        throw error;
      },
    );
  }

  // Put
  void updateProduct(String id, Product newProduct) {
    final productIndex = _items.indexWhere((product) => product.id == id);
    if (productIndex >= 0) {
      _items[productIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  // Delete
  Future<void> deleteProduct(String id) async {
    final url = Uri.parse(
        'https://flutter-shop-app-e61d9-default-rtdb.asia-southeast1.firebasedatabase.app/products.json');

    try {
      final response = await http
          .delete(
        url,
        body: json.encode(
          {
            'id': id,
          },
        ),
      );

      if (response.statusCode == 200) {
        _items.removeWhere((product) => product.id == id);
        notifyListeners();
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
