import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens & Routes
import 'package:shop_app/screens/products_overview_screen.dart'; // ProductsOverviewScreen
import 'package:shop_app/screens/cart_screen.dart'; // CartScreen
import 'package:shop_app/screens/product_detail_screen.dart'; // ProductDetailScreen

// Providers
import 'package:shop_app/providers/products.dart'; // Products
import 'package:shop_app/providers/cart.dart'; // Cart

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
        home: ProductsOverviewScreen(),

        // routes
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
