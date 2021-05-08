import 'package:flutter/material.dart';

// Routes
import 'package:great_places_app/screens/add_place_screen.dart'; // AddPlaceScreen

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },  
          ),
        ],
      ),
      // body
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
