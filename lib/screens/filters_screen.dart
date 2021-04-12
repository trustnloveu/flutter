import 'package:flutter/material.dart';

// Widgets
import 'package:food_diary/widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filteres';

  @override
  Widget build(BuildContext context) {
    // return
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filter Screen'),
      ),
    );
  }
}
