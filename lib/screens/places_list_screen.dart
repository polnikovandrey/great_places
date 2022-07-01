import 'package:flutter/material.dart';
import 'package:great_places_app/providers/places_provider.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  static const routePath = '/places-list';

  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(AddPlaceScreen.routePath),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<PlacesProvider>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<PlacesProvider>(
                builder: (context, placesProvider, child) {
                  return placesProvider.items.isEmpty
                      ? child!
                      : ListView.builder(
                          itemCount: placesProvider.items.length,
                          itemBuilder: (ctx, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(placesProvider.items[index].image),
                              ),
                              title: Text(placesProvider.items[index].title),
                              subtitle: Text(placesProvider.items[index].location!.address),
                              onTap: () {},
                            );
                          });
                },
                child: const Center(
                  child: Text('Got no places yet, start adding some.'),
                ),
              ),
      ),
    );
  }
}
