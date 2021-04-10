import 'package:flutter/material.dart';

class CategoryFoodScreen extends StatelessWidget {
  static const routeName = '/category-food';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryFoodScreen(
  //   this.categoryId,
  //   this.categoryTitle,
  // );

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    // return
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('Recipes'),
      ),
    );
  }
}
