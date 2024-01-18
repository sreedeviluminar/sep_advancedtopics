import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    home: FirebaseCrud(),
  ));
}

class FirebaseCrud extends StatefulWidget {
  @override
  State<FirebaseCrud> createState() => _FirebaseCrudState();
}

class _FirebaseCrudState extends State<FirebaseCrud> {
  var name_controller = TextEditingController();
  var email_controller = TextEditingController();
  late CollectionReference _userCollection;

  @override
  void initState() {
    _userCollection = FirebaseFirestore.instance.collection("users");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: const Text("Firebase Cloud Storage"),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: name_controller,
              decoration: const InputDecoration(
                  labelText: "Name", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: email_controller,
              decoration: const InputDecoration(
                  labelText: "Email", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  addUser();
                },
                child: const Text("ADD USER")),
            const SizedBox(
              height: 15,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: getUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error ${snapshot.error}");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  final users = snapshot.data!.docs;
                  return Expanded(
                      child: ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            final userId = user.id;
                            final userName = user['name'];
                            final userEmail = user['email'];
                            return ListTile(
                              title: Text(
                                '$userName',
                                style: const TextStyle(fontSize: 20),
                              ),
                              subtitle: Text('$userEmail',
                                  style: const TextStyle(fontSize: 15)),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        editUser(userId);
                                      },
                                      icon: const Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        deleteUser(userId);
                                      },
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                            );
                          }));
                })
          ],
        ),
      ),
    );
  }

  /// create user
  Future<void> addUser() async {
    return _userCollection.add({
      'name': name_controller.text,
      'email': email_controller.text
    }).then((value) {
      print("user added successfully");
      name_controller.clear();
      email_controller.clear();
    }).catchError((error) {
      print("failed to add user $error");
    });
  }

  ///read user
  Stream<QuerySnapshot> getUser() {
    return _userCollection.snapshots();
  }

  void editUser(var id) {
    showDialog(
        context: context,
        builder: (context) {
          final newname_cntlr = TextEditingController();
          final newemail_cntrlr = TextEditingController();

          return AlertDialog(
            title: const Text("Update User"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: newname_cntlr,
                  decoration: const InputDecoration(
                      hintText: "Enter name", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: newemail_cntrlr,
                  decoration: const InputDecoration(
                      hintText: "Enter name", border: OutlineInputBorder()),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    updateUser(id, newname_cntlr.text, newemail_cntrlr.text).then((value){
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Update"))
            ],
          );
        });
  }

  ///update user
  Future<void> updateUser(var id, String newname, String newemail) {
    return _userCollection
        .doc(id)
        .update({'name': newname, "email": newemail}).then((value) {
      print("User Updated Successfully");
    }).catchError((error) {
      print("User data Updation failed $error");
    });
  }

  Future<void> deleteUser(var id) {
    return _userCollection.doc(id).delete().then((value) {
      print("User Deleted Successfully");
    }).catchError((error) {
      print("User deletion failed $error");
    });
  }
}
