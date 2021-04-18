import 'package:flutter/material.dart';

// Routes
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  // Contructor
  ProductItem({
    this.id,
    this.title,
    this.imageUrl,
  });

  // build
  @override
  Widget build(BuildContext context) {
    // return
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.5),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          leading: IconButton(
            icon: Icon(Icons.favorite_rounded),
            color: Theme.of(context).accentColor,
            onPressed: () {},
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
// MaterialPageRoute(builder: (ctx) => ProductDetailScreen(title: title)),
// );
