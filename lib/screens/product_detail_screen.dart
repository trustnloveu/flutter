import 'package:flutter/material.dart';

// Main
class ProductDetailScreen extends StatelessWidget {
  // Route Name
  static const routeName = '/product-detail';

  // build
  @override
  Widget build(BuildContext context) {
    // Passed Arguments
    final productId = ModalRoute.of(context).settings.arguments as String;
    // ... DB will work with the given ID above

    // return
    return Scaffold(
      appBar: AppBar(
        title: Text(productId),
      ),
    );
  }
}
