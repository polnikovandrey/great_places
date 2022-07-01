import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places_app/helpers/location_helper.dart';
import 'package:great_places_app/screens/map_screen.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final void Function({required double latitude, required double longitude}) _selectPlace;

  const LocationInput({required void Function({required double latitude, required double longitude}) selectPlace, Key? key})
      : _selectPlace = selectPlace,
        super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
          height: 170,
          width: double.infinity,
          child: _previewImageUrl == null
              ? const Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getUserLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: _selectOnMap,
              icon: const Icon(Icons.map),
              label: const Text('Select On Map'),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _getUserLocation() async {
    try {
      final locationData = await Location().getLocation();
      if (locationData.latitude != null && locationData.longitude != null) {
        _showPreview(latitude: locationData.latitude!, longitude: locationData.longitude!);
        widget._selectPlace(latitude: locationData.latitude!, longitude: locationData.longitude!);
      }
    } catch(exception) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push<LatLng>(MaterialPageRoute(
      builder: (ctx) => const MapScreen(selecting: true),
    ));
    if (selectedLocation != null) {
      _showPreview(latitude: selectedLocation.latitude, longitude: selectedLocation.longitude);
      widget._selectPlace(latitude: selectedLocation.latitude, longitude: selectedLocation.longitude);
    }
  }

  void _showPreview({required double latitude, required double longitude}) {
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(latitude: latitude, longitude: longitude);
    setState(() => _previewImageUrl = staticMapImageUrl);
  }
}
