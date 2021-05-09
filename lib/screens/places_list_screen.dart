import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Providers
import 'package:great_places_app/providers/great_places.dart'; // GreatPlaces

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
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text('Got no places yet, start adding some!'),
        ),
        builder: (ctx, greatePlaces, child) {
          if (greatePlaces.items.length <= 0) {
            return child as Widget;
          }
          return ListView.builder(
            itemCount: greatePlaces.items.length,
            itemBuilder: (ctx, i) {
              return ListTile(
                // leading
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    greatePlaces.items[i].image,
                  ),
                ),
                // title
                title: Text(greatePlaces.items[i].title),
                // event
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
