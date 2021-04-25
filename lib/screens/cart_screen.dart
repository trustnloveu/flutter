import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Provider
import 'package:shop_app/widgets/cart_item.dart'; // CartItem

// Widgets
import 'package:shop_app/providers/cart.dart' show Cart; // Cart

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
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
          SizedBox(height: 10),
          Expanded(child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (ctx, i) => CartItem(
              cart.items.values.toList()[i].id,
              cart.items.keys.toList()[i],
              cart.items.values.toList()[i].price,
              cart.items.values.toList()[i].quantity,
              cart.items.values.toList()[i].title,
            ),),
          ),
        ],
      ),
    );
  }
}
