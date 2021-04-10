import 'package:flutter/material.dart';

// Widget
import 'package:food_diary/screens/categories_screen.dart'; // CategoryScreen
import 'package:food_diary/screens/category_food_screen.dart'; // CategoriesFoodScreen

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Diary',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),

      // routes
      initialRoute: '/', // default is '/'
      routes : {
        '/' : (ctx) => CategoriesScreen(),
        // '/category-food' : (ctx) => CategoryFoodScreen(),
        CategoryFoodScreen.routeName : (ctx) => CategoryFoodScreen(),
      },

      // home
      // home: CategoriesScreen(),
    );
  }
}
