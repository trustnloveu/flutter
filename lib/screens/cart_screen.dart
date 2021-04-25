import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider
import 'package:shop_app/providers/cart.dart'; // Cart

class CartScreen extends StatelessWidget {
  // Route Name
  static const routeName = '/cart';

  CartScreen();

  // build
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    // return
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              .color),
                    ),
                  ),
                  TextButton(
                    child: Text('Order Now'),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
