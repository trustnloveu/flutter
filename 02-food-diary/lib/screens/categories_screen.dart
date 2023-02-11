import 'package:flutter/material.dart';

// Widgets
import 'package:food_diary/widgets/category_item.dart';

// Dummy Data
import 'package:food_diary/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  // build
  @override
  Widget build(BuildContext context) {
    // return
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2, // = 1.5
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: [
        ...DUMMY_CATEGORIES.map(
          (data) => CategoryItem(
            data.id,
            data.title,
            data.color,
          ),
        ),
      ],
    );
  }
}
