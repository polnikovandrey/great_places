import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places_app/helpers/db_helper.dart';
import 'package:great_places_app/models/place.dart';

class PlacesProvider with ChangeNotifier {
  static const placesTable = 'user_places';

  final List<Place> _items = [];

  List<Place> get items => [..._items];

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DbHelper.getData(table: placesTable);
    _items.clear();
    _items.addAll(dataList
        .map((data) => Place(
              id: data['id'].toString(),
              title: data['title'].toString(),
              image: File(data['image'].toString()),
            ))
        .toList());
    notifyListeners();
  }

  void addPlace({required String title, required File image}) {
    final newPlace = Place(id: DateTime.now().toIso8601String(), image: image, title: title);
    _items.add(newPlace);
    DbHelper.insert(
      table: placesTable,
      data: {
        'id': newPlace.id,
        'title': newPlace.title,
        'image': newPlace.image.path,
      },
    );
    notifyListeners();
  }
}
