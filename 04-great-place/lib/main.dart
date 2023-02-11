import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:great_places_app/providers/great_places.dart'; // GreatPlaces

// Screens & Routes
import 'package:great_places_app/screens/add_place_screen.dart'; // AddPlaceScreen
import 'package:great_places_app/screens/places_list_screen.dart'; // PlacesListScreen

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        // title
        title: 'Great Places',

        // theme
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),

        // home
        home: PlacesListScreen(),

        // routes
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
        },
      ),
    );
  }
}
