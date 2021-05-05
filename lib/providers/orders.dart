import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

// Model & Provider
import 'package:shop_app/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final String authToken;
  List<OrderItem> _orders = [];

  Orders(
    this.authToken,
    this._orders,
  );


  // Orders Getter
  List<OrderItem> get orders {
    return [..._orders];
  }

  // Get
  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
        'https://flutter-shop-app-e61d9-default-rtdb.asia-southeast1.firebasedatabase.app/orders.json?auth=$authToken');

    final response = await http.get(url);

    final List<OrderItem> loadedOrders = [];

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) return; // No Data (Map == null) ? return

    extractedData.forEach(
      (orderId, orderData) {
        loadedOrders.add(
          OrderItem(
            id: orderId,
            amount: orderData['amount'],
            dateTime: DateTime.parse(orderData['dateTime']),
            products: (orderData['products'] as List<dynamic>)
                .map(
                  (item) => CartItem(
                    id: item['id'],
                    title: item['title'],
                    price: item['price'],
                    quantity: item['quantity'],
                  ),
                )
                .toList(),
          ),
        );
      },
    );

    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  // Post
  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://flutter-shop-app-e61d9-default-rtdb.asia-southeast1.firebasedatabase.app/orders.json?auth=$authToken');

    final timestamp = DateTime.now(); // To match the exact time data

    // Update data to Database
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map(
              (cartProduct) => {
                'id': cartProduct.id,
                'title': cartProduct.title,
                'quantity': cartProduct.quantity,
                'price': cartProduct.price,
              },
            )
            .toList(),
      }),
    );

    // Update local Source (locally)
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );

    notifyListeners();
  }
}
