import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens & Routes
import 'package:shop_app/screens/auth_screen.dart'; // AuthScreen
import 'package:shop_app/screens/cart_screen.dart'; // CartScreen
import 'package:shop_app/screens/orders_screen.dart'; // OrdersScreen
import 'package:shop_app/screens/edit_product_screen.dart';  // EditProductScreen
import 'package:shop_app/screens/product_detail_screen.dart'; // ProductDetailScreen
import 'package:shop_app/screens/products_overview_screen.dart'; // ProductsOverviewScreen

// Providers
import 'package:shop_app/providers/cart.dart'; // Cart
import 'package:shop_app/providers/orders.dart'; // Orders
import 'package:shop_app/providers/products.dart'; // Products
import 'package:shop_app/screens/user_products_screen.dart'; // UserProductsScreen

// Run the app
void main() => runApp(MyApp());

// Main
class MyApp extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {
    // return
    return MultiProvider(
      // Providers
      providers: [
        // Products
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        // Cart
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        // Title
        title: 'Flutter Demo',

        // Theme
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.yellowAccent,
          fontFamily: 'Lato',
        ),

        // Home
        // home: ProductsOverviewScreen(),
        home: AuthScreen(),

        // routes
        routes: {
          // ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName : (ctx) => OrdersScreen(),
          UserProductsScreen.routeName : (ctx) => UserProductsScreen(),
          EditProductScreen.routeName : (ctx) => EditProductScreen(),
          // AuthScreen.routeName : (ctx) => AuthScreen(),
        },
      ),
    );
  }
}
