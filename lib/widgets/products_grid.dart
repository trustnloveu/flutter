import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // provider

// Widgets
import 'package:shop_app/widgets/product_item.dart';

// Providers
import 'package:shop_app/providers/products.dart';

// Main
class ProductsGrid extends StatelessWidget {
  final bool showFavotrieOption;

  // Constructor
  ProductsGrid(this.showFavotrieOption);

  // build
  @override
  Widget build(BuildContext context) {
    // Provider
    final productsData = Provider.of<Products>(context); // instance
    final products = showFavotrieOption
        ? productsData.favoritesItems
        : productsData.items; // call getter

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
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
    );
  }
}
