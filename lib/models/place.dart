import 'dart:io';

class Place {
  final String _id;
  final String _title;
  final Location _location;
  final File _image;

  Place({required String id, required String title, required Location location, required File image})
      : _id = id,
        _title = title,
        _location = location,
        _image = image;
}

class Location {
  final double _latitude;
  final double _longitude;
  final String _address;

  Location({required double latitude, required double longitude, String address = ''})
      : _latitude = latitude,
        _longitude = longitude,
        _address = address;
}
