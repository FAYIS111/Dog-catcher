import 'dart:io';
import 'dart:io' as io if (dart.library.html) 'dart:html';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/foundation.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:dog_catcher/widgets/Asset.dart';
import 'package:dog_catcher/widgets/TextField.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  PlatformFile? pickedFile;
  final CollectionReference dogCollection =
      FirebaseFirestore.instance.collection('dogCollection');
  TextEditingController userName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController contactNo = TextEditingController();

  String locationMessage = 'Current location of the user';
  late String lat;
  late String long;
   

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
          'Location permissions are permently denied, we cannot request');
    }
    return await Geolocator.getCurrentPosition();
  }


  void _liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
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

  Future<void> uploadFile() async {
  try {
    if (pickedFile != null) {
      if (kIsWeb) {
        // For web, use the Uint8List directly
        final Uint8List fileBytes = pickedFile!.bytes!;
        final ref = FirebaseStorage.instance.ref().child('files/${pickedFile!.name}');

        await ref.putData(fileBytes);

        String downloadURL = await ref.getDownloadURL();

        addCollection(downloadURL);
      } else {
        // For other platforms, use the file path
        final path = 'files/${pickedFile!.name}';
        final file = File(pickedFile!.path!);
        final ref = FirebaseStorage.instance.ref().child(path);

        await ref.putFile(file);

        String downloadURL = await ref.getDownloadURL();

        addCollection(downloadURL);
      }
    } else {
      print('No file selected');
    }
  } catch (e) {
    print('Error uploading file: $e');
  }
}


  void addCollection(String downloadURL) {
    final data = {
      'location': locationMessage,
      'description': description.text,
      'contactNo': contactNo.text,
      'userName': userName.text,
      'imageURL': downloadURL,
    };

    dogCollection.add(data);
  }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text(
          'SELECT IMAGE',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20.0),
          pickedFile == null
              ? Image.asset(
                  noImage,
                  height: 300.0,
                  width: double.infinity,
                )  : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: kIsWeb
                      ? Image.memory(
                          Uint8List.fromList(pickedFile!.bytes!),fit: BoxFit.fill,
                          width: 200,
                          height: 400,
                        )
                                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 400,
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: 14,
                        child: Image.file(
                          File(pickedFile!.path!),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
          appButton(
            color: MaterialStateProperty.all(Colors.orange),
            width: 150,
            height: 50,
            buttonText: "SELECT IMAGE",
            buttonAction:  () async {
              if (kIsWeb) {
                // For web, use FilePicker to select files
                await selectFile();
              } else {
                // For other platforms, show the image picker
                showImagePicker(context);
              }
            },
          ),
          AppTextField(
            labelText: 'UserName',
            keyBoardType: TextInputType.name,
            textController: userName,
          ),
          AppTextField(
            labelText: 'Contact No',
            keyBoardType: TextInputType.number,
            textController: contactNo,
          ),
          AppTextField(
            maxLine: 5,
            labelText: 'Report',
            keyBoardType: TextInputType.name,
            textController: description,
          ),
          appButton(
              color: MaterialStateProperty.all(Colors.greenAccent),
              buttonText: "GET CURRENT LOCATION",
              buttonAction: () {
                _getCurrentLocation().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                  setState(() {
                    locationMessage = 'Lat: $lat , Long: $long';
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
          Container(
            width: double.infinity,
            height: 150,
            child: Center(
              child: Text(locationMessage),
            ),
          ),
          const SizedBox(height: 10.0),
          appButton(
            color: MaterialStateProperty.all(Colors.greenAccent),
            width: 150,
            height: 50,
            buttonText: "SUBMIT",
            buttonAction: () {
              uploadFile();
              showNotification();
              Navigator.pushNamed(context, '/FinalPage');
            },
          ),
        ],
      ),
    );
  }

  final picker = ImagePicker();

  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 60.0,
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          "Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        )
                      ],
                    ),
                    onTap: () {
                      selectFile();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Camera",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  
 Future<void> selectFile() async {
    try {
      if (kIsWeb) {
        final result = await FilePicker.platform.pickFiles();
        if (result == null) return;

        setState(() {
          pickedFile = result.files.first;
        });
      } else {
        final result = await FilePicker.platform.pickFiles();
        if (result == null) return;

        setState(() {
          pickedFile = result.files.first;
        });
      }
    } catch (e) {
      print('Error selecting file: $e');
    }
  }

  _imgFromCamera() async {
    try {
      final image =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      if (image != null) {
        final length = await File(image.path!)
            .length(); // Await the result of the function call
        setState(() {
          pickedFile = PlatformFile(
            name: 'image.jpg',
            size: length,
            path: image.path,
          );
        });
      }
    } catch (e) {
      print('Error capturing image: $e');
    }
  }
}
