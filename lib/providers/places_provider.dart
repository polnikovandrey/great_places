import 'package:flutter/material.dart';
import 'package:great_places_app/models/place.dart';

class PlacesProvider with ChangeNotifier {

  final List<Place> _items = [];

  List<Place> get items => [..._items];

}