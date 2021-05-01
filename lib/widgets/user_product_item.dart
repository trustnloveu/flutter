import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';

// Route
import 'package:shop_app/screens/edit_product_screen.dart'; // EditProductScreen

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  // Constructor
  UserProductItem(
    this.id,
    this.title,
    this.imageUrl,
  );

  Future<void> deleteProduct() async {}

  // build
  @override
  Widget build(BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text('Failed to Delete the Item'),
    );

    // return
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            // Edit Productt Buttton
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                  arguments: id,
                );
              },
            ),
            // Delete Productt Buttton
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () async {
                try {
                  await Provider.of<Products>(context, listen: false)
                      .deleteProduct(id);
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } finally{
                  // print('Code in this block will always be executed');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
