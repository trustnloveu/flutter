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
      //* comment out when you use CustomScrollView (SliverAppBar)
      // appBar
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      // ),

      // body
      body: CustomScrollView(
        //* slivers : scrollable area on the screen
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title),
              background: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10),
                Text(
                  '\$${loadedProduct.price}',
                  textAlign: TextAlign.center,
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
                SizedBox(
                  height: 800,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
