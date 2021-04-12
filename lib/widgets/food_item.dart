import 'package:flutter/material.dart';

// Model
import 'package:food_diary/models/food.dart';
import 'package:food_diary/screens/food_detail_screen.dart';

class FoodItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.imageURL,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeItem,
  });

  // Getter which returns String value from Enum
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unknown';
    }
  }

  // Getter which returns String value from Enum
  String get affordablityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  // Navigation toward FoodDetailScreen
  void selectFood(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      FoodDetailScreen.routeName,
      arguments: id,
    )
        .then( // this is not executed when this page pushed, it works when user come back to this page. Plus, with this, you can pass back some data, as well
      (result) {
        print(result);
        if (result != null) {
          removeItem(result);
        }
      },
    );
  }

  // build
  @override
  Widget build(BuildContext context) {
    // return
    return InkWell(
      onTap: () => selectFood(context),
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
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black45,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text('$duration min'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text('$complexityText'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text('$affordablityText'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
