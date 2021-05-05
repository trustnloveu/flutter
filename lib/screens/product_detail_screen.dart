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
      // appBar
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),

      // body
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: loadedProduct.id,
                              child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                loadedProduct.description,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
