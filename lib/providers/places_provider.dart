import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places_app/models/place.dart';

class PlacesProvider with ChangeNotifier {

  final List<Place> _items = [];

  List<Place> get items => [..._items];

  void addPlace({required String title, required File image}) {
    final newPlace = Place(id: DateTime.now().toIso8601String(), image: image, title: title);
    _items.add(newPlace);
    notifyListeners();
  }
}