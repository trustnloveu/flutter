import 'package:flutter/material.dart';

// Model
import 'package:food_diary/models/food.dart';

// Widgets & Screen
import 'package:food_diary/screens/categories_screen.dart';
import 'package:food_diary/screens/favorites_screen.dart';
import 'package:food_diary/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Food> favoriteFoods;

  TabsScreen(this.favoriteFoods);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _pages;

  // you can avoid error when you initialize variables with passed values
  // , like widget.someValue, by handling it in 'initStaet()'
  @override
  initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'label': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteFoods), 
        'label': 'Favorites',
      },
      // you can add any other property, like actions : [] ...
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    // index is automatically given
    setState(() {
      _selectedPageIndex = index;
    });
  }


  // build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text('Food'),
      ),

      // Drawer
      drawer: MainDrawer(),

      // Body
      body: _pages[_selectedPageIndex]['page'],

      // Bar
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting, // 'fix' is default
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: _pages[_selectedPageIndex]['label'],
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: _pages[_selectedPageIndex]['label'],
          ),
        ],
      ),
    );
  }
}
