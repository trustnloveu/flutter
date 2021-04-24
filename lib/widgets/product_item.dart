import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model
import 'package:shop_app/providers/product.dart';

// Routes
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // Contructor
  ProductItem();

  // build
  @override
  Widget build(BuildContext context) {
    // product provider
    final product = Provider.of<Product>(context, listen: false);

    // return
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.5),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                product.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
              ),
              // label: child // note: how to use child property of Consumer builder
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
            // child : Widget(...), // note : child property of Consumer builder
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
//* Side Note */
// Navigator.of(context).push(
//  MaterialPageRoute(builder: (ctx) => ProductDetailScreen(title: title)),
// );
