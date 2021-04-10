import 'package:flutter/material.dart';

// Model
import 'package:food_diary/models/food.dart';

class FoodItem extends StatelessWidget {
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  FoodItem({
    @required this.title,
    @required this.imageURL,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  void selectFood() {}


  // build
  @override
  Widget build(BuildContext context) {
    // return
    return InkWell(
      onTap: selectFood,
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Stack(
              // fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: Image.network(
                    imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
