import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:shop_app/providers/auth.dart'; // Auth

// Routes
import 'package:shop_app/helpers/custom_route.dart'; // CustomRoute
import 'package:shop_app/screens/orders_screen.dart'; // OrdersScreen
import 'package:shop_app/screens/user_products_screen.dart'; // UserProductsScreen

class AppDrawer extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {
    // return
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_rounded),
            title: Text('Show'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_rounded),
            title: Text('Orders'),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
              Navigator.of(context).pushReplacement(
                CustomRoute(
                  builder: (ctx) => OrdersScreen(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_rounded),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed('/');

              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
