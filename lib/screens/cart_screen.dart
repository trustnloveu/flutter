import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';

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
    // Cart Provider
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
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              .color),
                    ),
                  ),

                  // Submit a list of orders
                  OrderButton(cart: cart),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Order Button Widget
class OrderButton extends StatefulWidget {
  final Cart cart;

  const OrderButton({
    @required this.cart,
  });

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  // For Loading Spinner
  var _isLoading = false;

  // build
  @override
  Widget build(BuildContext context) {
    // return
    return TextButton(
      child: _isLoading
          ? CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColor,
            )
          : Text('Order Now'),
      style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
      // addOrder Event
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
            },
    );
  }
}
