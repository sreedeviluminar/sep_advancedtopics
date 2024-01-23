import 'package:flutter/material.dart';

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
                  askCameraPemission();
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

  void askCameraPemission() {}

  void askMultiplePemissions() {}

  void openAppSettings() {}
}
