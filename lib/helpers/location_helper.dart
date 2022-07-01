const googleApiKey = 'AIzaSyAoOcP9-q-QXfEHQJb0PyttXsXLuS6uYno';

class LocationHelper {
  static String generateLocationPreviewImage({required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,&$longitude&zoom=16&size=400x400&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleApiKey';
  }
}