import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBnOUuyX1k1DLl7FyaU8gFj_CH6Evp9iZk",
          appId: "1:526881800339:android:a4ad1898b85bf2605c0d66",
          messagingSenderId: "",
          projectId: "healthy-reason-330908",
          storageBucket: "healthy-reason-330908.appspot.com"));
  runApp(MaterialApp(
    home: Fire_Img_storage(),
  ));
}

class Fire_Img_storage extends StatefulWidget {
  @override
  State<Fire_Img_storage> createState() => _Fire_Img_storageState();
}

class _Fire_Img_storageState extends State<Fire_Img_storage> {
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Image Store"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                    onPressed: () => upload("camera"),
                    icon: Icon(Icons.camera),
                    label: Text("Camera")),
                ElevatedButton.icon(
                    onPressed: () => upload("gallery"),
                    icon: Icon(Icons.photo),
                    label: Text("Gallery"))
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: loadMedia(),
                  /// images returned from  method
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final image = snapshot.data![index];
                            return Card(
                              child: ListTile(
                                leading: Image.network(image['imageurl']),
                                title: Text(image['uploaded_by']),
                                subtitle: Text(image['time']),
                                trailing: IconButton(
                                    onPressed: () => deleteMedia(image['path']),
                                    icon: Icon(Icons.delete)),
                              ),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  }))
        ],
      ),
    );
  }

  Future<void> upload(String imageFrom) async {
    final picker = ImagePicker();
    XFile? pickedImge;

    try {
      pickedImge = await picker.pickImage(
          source:
              imageFrom == "camera" ? ImageSource.camera : ImageSource.gallery);
      final String filename = path.basename(pickedImge!.path);
      File imageFile = File(pickedImge.path);

      try {
        await storage.ref(filename).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': "Phone Name",
              'time': "${DateTime.now().isUtc}"
            }));
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (error) {
      print(error);
    }
  }

  ///load images from firebase
  Future<List<Map<String, dynamic>>> loadMedia() async {
    List<Map<String, dynamic>> images = [];
    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

    await Future.forEach(allFiles, (singleFile) async {
      final String fileUrl = await singleFile.getDownloadURL();
      final FullMetadata metadata = await singleFile.getMetadata();

      images.add({
        'imageurl': fileUrl,
        'path': singleFile.fullPath,
        'uploaded_by': metadata.customMetadata?['uploaded_by'] ?? metadata.fullPath,
        'time': metadata.customMetadata?['time'] ?? "No Time Found"
      });
    });
    return images;
  }

  Future<void> deleteMedia(String imagePath) async {
    await storage.ref(imagePath).delete();
    setState(() {});
  }
}
