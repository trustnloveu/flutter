import 'package:flutter/material.dart';

// Widgets
import 'package:shop_app/widgets/products_grid.dart';

// Main
class ProductsOverviewScreen extends StatelessWidget {
  

  // Contructor
  ProductsOverviewScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text('My Shop'),
      ),

      // Body
      body: ProductsGrid(),
    );
  }
}

