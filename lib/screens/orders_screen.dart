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
  // To avoid unnecessary building
  Future _ordersFuture;
  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  // initState
  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Orders Provier > initState || didChangeDependencies > isLoading > Build Widget
    // final orderData = Provider.of<Orders>(context);

    // return
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: Text('Your Orders'),
      ),

      // drawer
      drawer: AppDrawer(),

      // body > FutureBuilder
      body: FutureBuilder(
        // future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        future: _ordersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            );
          } else {
            if (snapshot.error != null) {
              // ... Do error handling stuff
              return Center(child: Text('An error occurred!'));
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (ctx, i) => OrderItem(
                    orderData.orders[i],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

//* Note
// isLoading >
// var _isLoading = false;

// Stateful Widget > initState
// @override
// void initState() {
// You don't need Future.delayed, once you set 'listen : false' false
// Future.delayed(Duration.zero).then((_) async { ... });

// _isLoading = true;

// Provider.of<Orders>(context, listen: false).fetchAndSetOrders().then((_) {
//   setState(() {
//     _isLoading = false;
//   });
// });

//   super.initState();
// }
