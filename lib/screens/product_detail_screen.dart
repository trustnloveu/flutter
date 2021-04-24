import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // provider

// Provider
import 'package:shop_app/providers/products.dart';

// Main
class ProductDetailScreen extends StatelessWidget {
  // Route Name
  static const routeName = '/product-detail';

  // build
  @override
  Widget build(BuildContext context) {
    // Passed Arguments
    final productId = ModalRoute.of(context).settings.arguments as String;

    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    // ... DB will work with the given ID above

    // return
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
