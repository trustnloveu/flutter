import 'package:flutter/material.dart';

// Model
import 'package:food_diary/models/food.dart';

// Widgets
import 'package:food_diary/widgets/food_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Food> favoriteFoods;

  FavoritesScreen(this.favoriteFoods);

  // build
  @override
  Widget build(BuildContext context) {
    // return
    if (favoriteFoods.isEmpty) {
      return Container(
        child: Text('You have no favorites yet - Start adding some!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteFoods.length,
        itemBuilder: (ctx, index) {
          return FoodItem(
            id: favoriteFoods[index].id,
            title: favoriteFoods[index].title,
            imageURL: favoriteFoods[index].imageURL,
            duration: favoriteFoods[index].duration,
            complexity: favoriteFoods[index].complexity,
            affordability: favoriteFoods[index].affordability,
            // removeItem: _removeFood,
          );
        },
      );
    }
  }
}
