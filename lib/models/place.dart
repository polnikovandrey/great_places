import 'dart:io';

class Place {
  final String _id;
  final String _title;
  final File _image;
  final Location? _location;

  const Place({required String id, required String title, required File image, Location? location})
      : _id = id,
        _title = title,
        _image = image,
        _location = location;

  Location? get location => _location;

  File get image => _image;

  String get title => _title;

  String get id => _id;
}

class Location {
  final double _latitude;
  final double _longitude;
  final String _address;

  const Location({required double latitude, required double longitude, String address = ''})
      : _latitude = latitude,
        _longitude = longitude,
        _address = address;

  double get latitude => _latitude;

  double get longitude => _longitude;

  String get address => _address;
}
