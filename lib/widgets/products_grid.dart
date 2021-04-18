import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // provider

// Widgets
import 'package:shop_app/widgets/product_item.dart';

// Providers
import 'package:shop_app/providers/products.dart';

// Main
class ProductsGrid extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {
    // Provider
    final productsData = Provider.of<Products>(context); // instance
    final products = productsData.items; // call getter

    // return
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductItem(
        id: products[i].id,
        title: products[i].title,
        imageUrl: products[i].imageUrl,
      ),
    );
  }
}
