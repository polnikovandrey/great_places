import 'package:flutter/material.dart';
import 'package:great_places_app/providers/places_provider.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:great_places_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const GreatPlacesApp());

class GreatPlacesApp extends StatelessWidget {
  const GreatPlacesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlacesProvider(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, secondary: Colors.amber)),
        initialRoute: PlacesListScreen.routePath,
        routes: {
          PlacesListScreen.routePath: (_) => const PlacesListScreen(),
          AddPlaceScreen.routePath: (_) => const AddPlaceScreen(),
        },
      ),
    );
  }
}
