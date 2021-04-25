import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model & Provider
import 'package:shop_app/providers/products.dart'; // Products

// Widgets
import 'package:shop_app/widgets/app_drawer.dart'; // AppDrawer
import 'package:shop_app/widgets/user_product_item.dart'; // UserProductItem

class UserProductsScreen extends StatelessWidget {
  // Route Name
  static const routeName =  '/user-products';

  // build
  @override
  Widget build(BuildContext context) {
    // Products Provider
    final productsData = Provider.of<Products>(context);

    // return
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // ...
            },
          ),
        ],
      ),

      // drawer
      drawer: AppDrawer(),

      // body
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                productsData.items[i].title,
                productsData.items[i].imageUrl,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
