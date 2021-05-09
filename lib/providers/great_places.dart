import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

// Model
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  // Getter
  List<Place> get items {
    return [..._items];
  }

  // Add Place
  void addPlace(String title, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: title,
      location: PlaceLocation( // temp
        latitude: 1,
        longitude: 2,
      ),
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
