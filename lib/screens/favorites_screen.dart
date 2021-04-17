import 'package:flutter/material.dart';

// Model
import 'package:food_diary/models/food.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Food> favoriteFoods;
  
  FavoritesScreen(this.favoriteFoods);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('You have no favorites yet - Start adding some!'),
    );
  }
}