import 'dart:io';
import 'package:dog_catcher/widgets/AppButton.dart';
import 'package:dog_catcher/widgets/Asset.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  PlatformFile? pickedFile;

  Future uploadFile() async {
    try {
      if (pickedFile != null) {
        final path = 'files/${pickedFile!.name}';
        final file = File(pickedFile!.path!);
        final ref = FirebaseStorage.instance.ref().child(path);

        // Upload file to Firebase Storage
        await ref.putFile(file);

        // Add further processing or navigate to the next screen here
        print('File Uploaded Successfully');
      } else {
        print('No file selected');
      }
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'SELECT IMAGE',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              appButton(
                color: MaterialStateProperty.all(Colors.orange),
                width: 150,
                height: 50,
                buttonText: "SELECT IMAGE",
                buttonAction: () async {
                  Map<Permission, PermissionStatus> statuses = await [
                    Permission.storage,
                    Permission.camera,
                  ].request();
                  if (statuses[Permission.storage]!.isGranted &&
                      statuses[Permission.camera]!.isGranted) {
                    showImagePicker(context);
                  } else {
                    print('No permission provided');
                  }
                },
              ),
              const SizedBox(height: 20.0),
              pickedFile == null
                  ? Image.asset(
                      noImage,
                      height: 500.0,
                      width: 400.0,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 600,
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
              const SizedBox(height: 20.0),
              appButton(
                color: MaterialStateProperty.all(Colors.greenAccent),
                width: 150,
                height: 50,
                buttonText: "NEXT",
                buttonAction: () {
                  setState(() {
                    uploadFile();
                    Navigator.pushNamed(context, '/LocationPage');
                  });
                },
              ),
            ],
          ),
        ),
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
                    child: Column(
                      children: const [
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
                    child: SizedBox(
                      child: Column(
                        children: const [
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

  Future selectFile() async {
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result == null) return;
      setState(() {
        pickedFile = result.files.first;
      });
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
