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
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          if (widget._selecting)
            IconButton(
              onPressed: _pickedLocation == null
                  ? null
                  : () => Navigator.of(context).pop(_pickedLocation),
              icon: const Icon(Icons.check),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget._initialLocation.latitude,
            widget._initialLocation.longitude,
          ),
          zoom: 16,
        ),
        onTap: widget._selecting ? _selectLocation : null,
        markers: _pickedLocation == null
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position: _pickedLocation!,
                )
              },
      ),
    );
  }

  void _selectLocation(LatLng position) {
    setState(() => _pickedLocation = position);
  }
}
