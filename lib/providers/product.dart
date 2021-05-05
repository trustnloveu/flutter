import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavoriteValue(bool value) {
    isFavorite = value;
    notifyListeners();
  }

  // Patch > isFavorite ( true / false )
  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final url = Uri.parse(
        'https://flutter-shop-app-e61d9-default-rtdb.asia-southeast1.firebasedatabase.app/userFavorites/$userId/$id.json?auth=$token');
    final oldStatus = isFavorite; // For roll-back

    _setFavoriteValue(!isFavorite);
    try {
      final response = await http.put(
        url,
        body: json.encode(
          isFavorite,
        ),
      );

      if (response.statusCode >= 400) {
        _setFavoriteValue(oldStatus);
      }
    } catch (e) {
      _setFavoriteValue(oldStatus);
    }
  }
}
