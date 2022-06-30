import 'package:flutter/material.dart';
import 'package:great_places_app/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  static const routePath = '/places-list';

  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(AddPlaceScreen.routePath),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
