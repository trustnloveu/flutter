import 'package:flutter/material.dart';

// Model & Dummy Data
import 'package:food_diary/models/food.dart';
import 'package:food_diary/dummy_data.dart';

// Widget
// import 'package:food_diary/screens/categories_screen.dart'; // CategoryScreen
import 'package:food_diary/screens/category_food_screen.dart'; // FoodDetailScreen
import 'package:food_diary/screens/filters_screen.dart'; // FiltersScreen
import 'package:food_diary/screens/food_detail_screen.dart'; // FoodDetailScreen
import 'package:food_diary/screens/tabs_screen.dart'; // CategoriesFoodScreen

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Food> _availableFoods = DUMMY_FOODS;

  void _setFilters(Map<String, bool> filterData) {
    print(filterData);
    setState(() {
      _filters = filterData;

      _availableFoods = DUMMY_FOODS.where((food) {
        if (_filters['gluten'] && !food.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !food.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !food.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !food.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    }); 
  }

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
      routes: {
        // '/' : (ctx) => CategoriesScreen(),
        '/': (ctx) => TabsScreen(),
        CategoryFoodScreen.routeName: (ctx) => CategoryFoodScreen(
            _availableFoods), // '/category-food' : (ctx) => CategoryFoodScreen(),
        FoodDetailScreen.routeName: (ctx) => FoodDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters),
      },

      // default route
      onGenerateRoute: (settings) {
        // print(settings.arguments);
        // For dynamic routing, you can make use of 'onGenerateRoute'
        // if (settings.name == 'food-detail') return ...;
        // else if (settings.name == 'something-else') return ...;
        // else ...;
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },

      // default route (404 page)
      // It's reached when Flutter failed to build a screen with all other measures
      onUnknownRoute: (settings) {
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },

      // home
      // home: CategoriesScreen(),
    );
  }
}
