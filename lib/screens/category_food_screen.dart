import 'package:flutter/material.dart';

// Widgets
import 'package:food_diary/widgets/food_item.dart';

// Dummy Data
import 'package:food_diary/dummy_data.dart';

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
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    // filtered category
    final categoryFoods = DUMMY_FOODS.where((food) {
      return food.categories.contains(categoryId);
    }).toList();

    // return
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryFoods.length,
          itemBuilder: (ctx, index) {
            return FoodItem(
              id: categoryFoods[index].id,
              title: categoryFoods[index].title,
              imageURL: categoryFoods[index].imageURL,
              duration: categoryFoods[index].duration,
              complexity: categoryFoods[index].complexity,
              affordability: categoryFoods[index].affordability,
            );
          },
        ),
      ),
    );
  }
}
