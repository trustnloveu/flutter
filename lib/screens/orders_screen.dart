import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model & Provider
import 'package:shop_app/providers/orders.dart' show Orders; // Orders
import 'package:shop_app/widgets/order_item.dart'; // OrderItem
import 'package:shop_app/widgets/app_drawer.dart'; // AppDrawer

class OrdersScreen extends StatefulWidget {
  // Route Name
  static const routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // isLoading
  var _isLoading = false;

  // initState
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });

    super.initState();
  }

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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            )
          : ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: (ctx, i) => OrderItem(
                orderData.orders[i],
              ),
            ),
    );
  }
}
