import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places_app/models/place.dart';

class MapScreen extends StatefulWidget {
  final Location _initialLocation;
  final bool _selecting;

  const MapScreen({Location initialLocation = const Location(latitude: 37.422, longitude: -122.084), bool selecting = false, Key? key})
      : _initialLocation = initialLocation,
        _selecting = selecting,
        super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget._initialLocation.latitude,
            widget._initialLocation.longitude,
          ),
          zoom: 16,
        ),
      ),
    );
  }
}
