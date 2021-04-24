import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Screens
import 'package:shop_app/screens/products_overview_screen.dart';

// Routes
import 'package:shop_app/screens/product_detail_screen.dart';

// Providers
import 'package:shop_app/providers/products.dart';

// Run the app
void main() => runApp(MyApp());

// Main
class MyApp extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {
    // return
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
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
        },
      ),
    );
  }
}
