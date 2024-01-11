import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String locationMessage = 'Current location of the user';
  late String lat;
  late String long;
  //getting current location
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location Services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permission are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permently denied,we cannot request');
    }
    return await Geolocator.getCurrentPosition();
  }

  //Listen to location updates
  void _liveLocation() {
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
      setState(() {
        locationMessage = 'Latitude:$lat , Longitude: $long';
      });
    });
  }

  //open the current location in google map
  Future<void> _openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(locationMessage),
          ElevatedButton(
            onPressed: () {
              _getCurrentLocation().then((value) {
                lat = '${value.latitude}';
                long = '${value.longitude}';
                setState(() {
                  locationMessage = 'Latitude: $lat , Longitude: $long';
                });
                _liveLocation();
              });
            },
            child: Text('Get current location'),
          ),
          ElevatedButton(
            onPressed: () {
              _openMap(lat, long);
            },
            child: Text('open the google map'),
          ),
        ],
      ),
    );
  }
}
