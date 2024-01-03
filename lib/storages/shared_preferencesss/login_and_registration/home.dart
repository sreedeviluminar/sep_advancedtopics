import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/shared_preferencesss/login_and_registration/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_Home extends StatefulWidget {
  const Shared_Home({super.key});

  @override
  State<Shared_Home> createState() => _Shared_HomeState();
}

class _Shared_HomeState extends State<Shared_Home> {
  late SharedPreferences preferences;
  String? username;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async{
    preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $username !!!!!"),
        elevation: 4,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              preferences.setBool('newUser', true);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginShared()));
            },
            child: Text("LogOut")),
      ),
    );
  }
}
