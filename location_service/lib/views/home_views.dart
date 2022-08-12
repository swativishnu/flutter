import 'package:flutter/material.dart';
import 'package:location_service/services/location.dart';
import 'package:location_service/services/location_services.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final locationService = getIt<LocationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location service')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          locationService.getLocation();
        },
        child: const Icon(Icons.upload_file),
      ),
    );
  }
}
