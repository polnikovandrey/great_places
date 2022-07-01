import 'dart:convert';
import 'package:http/http.dart' as http;

const googleApiKey = 'AIzaSyAoOcP9-q-QXfEHQJb0PyttXsXLuS6uYno';

class LocationHelper {
  static String generateLocationPreviewImage({required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,&$longitude&zoom=16&size=400x400&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleApiKey';
  }

  static Future<String> getPlaceAddress({required double latitude, required double longitude}) async {
    final uri = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$googleApiKey');
    final response = await http.get(uri);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}