import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    home: Permisisonnss(),
  ));
}

class Permisisonnss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  askCameraPemission(context);
                },
                child: const Text("Camera")),
            ElevatedButton(
                onPressed: () {
                  askMultiplePemissions();
                },
                child: const Text("Mutiple Permission")),
            ElevatedButton(
                onPressed: () {
                  openAppSettings();
                },
                child: const Text("Settings"))
          ],
        ),
      ),
    );
  }

  void askCameraPemission(BuildContext context) async {
    var status = await Permission.camera.status;
    if (await Permission.camera.request().isGranted) {
      var picker = ImagePicker();
      picker.pickImage(source: ImageSource.camera);
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Permission Denied")));
    }
  }

  void askMultiplePemissions() async {
  Map<Permission, PermissionStatus> status = await [
    Permission.location,
    Permission.contacts,
    Permission.mediaLibrary,
    Permission.phone,
    Permission.microphone,
    Permission.photos
  ].request();
  print("status location ${status[Permission.location]} photos ${status[Permission.photos]}");
  }

  void openAppSettings() async{
    openAppSettings();
  }
}
