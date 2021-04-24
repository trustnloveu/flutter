import 'package:flutter/material.dart';

// Widgets
import 'package:shop_app/widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

// Main
class ProductsOverviewScreen extends StatefulWidget {
  // Contructor
  ProductsOverviewScreen();

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  // build
  @override
  Widget build(BuildContext context) {
    // return
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_horiz_rounded),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),

      // Body
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
