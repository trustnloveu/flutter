import 'package:flutter/material.dart';

// Screens
import 'package:shop_app/screens/products_overview_screen.dart';

// Run the app
void main() => runApp(MyApp());

// Main
class MyApp extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {
    // return
    return MaterialApp(
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
    );
  }
}