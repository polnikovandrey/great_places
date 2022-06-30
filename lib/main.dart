import 'package:flutter/material.dart';
import 'package:great_places_app/providers/places_provider.dart';
import 'package:great_places_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const GreatPlacesApp());

class GreatPlacesApp extends StatelessWidget {
  static const routePath = '/';

  const GreatPlacesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlacesProvider(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, secondary: Colors.amber)),
        routes: {
          routePath: (_) => const PlacesListScreen(),
        },
      ),
    );
  }
}
