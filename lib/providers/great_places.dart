import 'package:flutter/material.dart';

// Model
import 'package:great_places_app/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  // Getter
  List<Place> get items {
    return [..._items];
  }
}
