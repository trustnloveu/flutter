import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Route
import 'package:shop_app/screens/edit_product_screen.dart'; // EditProductScreen

// Model & Provider
import 'package:shop_app/providers/products.dart'; // Products

// Widgets
import 'package:shop_app/widgets/app_drawer.dart'; // AppDrawer
import 'package:shop_app/widgets/user_product_item.dart'; // UserProductItem

class UserProductsScreen extends StatelessWidget {
  // Route Name
  static const routeName = '/user-products';

  // onRefresh Event
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetProducts(true);
  }

  // build
  @override
  Widget build(BuildContext context) {
    print('building user_products_screen'); // To check infitite loop(build)
    // Products Provider
    // final productsData = Provider.of<Products>(context); // because of FutureBuilder

    // return
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),

      // drawer
      drawer: AppDrawer(),

      // body
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshProducts(context),
                    child: Consumer<Products>(
                      builder: (ctx, productsData, _) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: productsData.items.length,
                          itemBuilder: (_, i) => Column(
                            children: [
                              UserProductItem(
                                productsData.items[i].id,
                                productsData.items[i].title,
                                productsData.items[i].imageUrl,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
