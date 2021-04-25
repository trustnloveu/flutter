import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model & Provider
import 'package:shop_app/providers/orders.dart' show Orders; // Orders
import 'package:shop_app/widgets/order_item.dart'; // OrderItem
import 'package:shop_app/widgets/app_drawer.dart'; // AppDrawer

class OrdersScreen extends StatelessWidget {
  // Route Name
  static const routeName = '/orders';

  // build
  @override
  Widget build(BuildContext context) {
    // Orders Provier
    final orderData = Provider.of<Orders>(context);

    // return
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: Text('Your Orders'),
      ),

      // drawer
      drawer: AppDrawer(),

      // body
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(
          orderData.orders[i],
        ),
      ),
    );
  }
}
