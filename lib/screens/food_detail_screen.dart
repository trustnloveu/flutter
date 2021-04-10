import 'package:flutter/material.dart';

class FoodDetailScreen extends StatelessWidget {
  // route name
  static const routeName = '/food-detail';

  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context).settings.arguments as String;

    // return
    return Scaffold(
      appBar: AppBar(
        title: Text('$foodId'),
      ),
      body: Center(
        child: Text('Food Details - $foodId'),
      ),
    );
  }
}
