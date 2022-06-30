import 'package:flutter/material.dart';

void main() => runApp(const GreatPlacesApp());

class GreatPlacesApp extends StatelessWidget {
  const GreatPlacesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, secondary: Colors.amber)),
    );
  }
}
