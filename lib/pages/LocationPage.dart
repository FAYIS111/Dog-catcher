import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:dog_catcher/widgets/TextField.dart';
import "package:flutter/material.dart";
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final CollectionReference dogCollection =
      FirebaseFirestore.instance.collection('dogCollection');
  TextEditingController description = TextEditingController();

  void addCollection() {
    final data = {
      'location': locationMessage,
      'description': description.text,
    };
    dogCollection.add(data);
  }

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
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  showNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: 'Notification for you',
        body: description.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 6,
                right: 6,
              ),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .5,
                color: Colors.grey.shade300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(115),
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(110),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 7,
                              blurRadius: 15,
                              offset: Offset(10, 5),
                            ),
                          ],
                        ),
                        width: 350,
                        height: 150,
                        child: Center(
                          child: Text(locationMessage),
                        ),
                      ),
                    ),
                    appButton(
                        color: MaterialStateProperty.all(Colors.greenAccent),
                        buttonText: "GET CURRENT LOCATION",
                        buttonAction: () {
                          _getCurrentLocation().then((value) {
                            lat = '${value.latitude}';
                            long = '${value.longitude}';
                            setState(() {
                              locationMessage =
                                  'Latitude: $lat , Longitude: $long';
                            });
                            _liveLocation();
                          });
                        }),
                    appButton(
                        color: MaterialStateProperty.all(Colors.greenAccent),
                        buttonText: "OPEN THE GOOGLE MAP",
                        buttonAction: () {
                          _openMap(lat, long);
                        }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                left: 6,
                right: 6,
              ),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .2,
                child: AppTextField(
                  textController: description,
                  maxLine: 5,
                  labelText: "REPORT INCIDENT",
                  keyBoardType: TextInputType.name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: appButton(
                width: 150,
                height: 70,
                color: MaterialStateProperty.all(Colors.purple),
                buttonText: "SUBMIT",
                buttonAction: () {
                  setState(() {
                    showNotification();
                    addCollection();
                    Navigator.pushNamed(context, '/FinalPage');
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
