import 'package:flutter/material.dart';

// Models
import 'package:food_diary/models/food.dart';

// Widgets
import 'package:food_diary/widgets/food_item.dart';

// Dummy Data
import 'package:food_diary/dummy_data.dart';

class CategoryFoodScreen extends StatefulWidget {
  static const routeName = '/category-food';

  final List<Food> availableFoods;

  CategoryFoodScreen(this.availableFoods);

  @override
  _CategoryFoodScreenState createState() => _CategoryFoodScreenState();
}

class _CategoryFoodScreenState extends State<CategoryFoodScreen> {
  String categoryTitle;
  List<Food> displayFoods;
  bool loadedInitData = false; // it's a breakpoint to executee didChangeDependencies run only once

  // initStaete
  @override
  void initState() {
    super.initState();
  }

  // didChangeDependencies
  @override
  void didChangeDependencies() {
    if (loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];

      // filtered category
      displayFoods = widget.availableFoods.where((food) { // < DUMMY_FOODS
        return food.categories.contains(categoryId);
      }).toList();

      loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  // remove specific food form list
  void _removeFood(String foodId) {
    setState(() {
      displayFoods.removeWhere((item) => item.id == foodId);
    });
  }

  // build
  @override
  Widget build(BuildContext context) {
    // return
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: displayFoods.length,
          itemBuilder: (ctx, index) {
            return FoodItem(
              id: displayFoods[index].id,
              title: displayFoods[index].title,
              imageURL: displayFoods[index].imageURL,
              duration: displayFoods[index].duration,
              complexity: displayFoods[index].complexity,
              affordability: displayFoods[index].affordability,
              // removeItem: _removeFood,
            );
          },
        ),
      ),
    );
  }
}
