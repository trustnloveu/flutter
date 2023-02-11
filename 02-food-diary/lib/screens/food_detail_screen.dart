import 'package:flutter/material.dart';

// Dummy Data
import 'package:food_diary/dummy_data.dart';

class FoodDetailScreen extends StatelessWidget {
  // route name
  static const routeName = '/food-detail';

  final Function toggleFavorite;
  final Function isFoodFavortie;

  FoodDetailScreen(this.toggleFavorite, this.isFoodFavortie);

  // Title Widget
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  // Content Container Widget
  Widget buildContainer(Widget child) {
    return Container(
      // margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }

  // build
  @override
  Widget build(BuildContext context) {
    // Single food ID
    final foodId = ModalRoute.of(context).settings.arguments as String;

    // Selected Food
    final selectedFood = DUMMY_FOODS.firstWhere((data) => data.id == foodId);

    // return
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedFood.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedFood.imageURL,
                fit: BoxFit.cover,
              ),
            ),

            // Ingredients
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedFood.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedFood.ingredients[index]),
                  ),
                ),
              ),
            ),

            // Steps
            buildSectionTitle(context, 'steps'),
            buildContainer(
              ListView.builder(
                itemCount: selectedFood.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedFood.steps[index]),
                    ),
                    Divider(
                      thickness: 1.5,
                      indent: 10.0,
                      endIndent: 10.0,
                      height: 12.5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFoodFavortie(foodId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          toggleFavorite(foodId);
          // Navigator.of(context).pop(foodId);
        },
      ),
    );
  }
}
