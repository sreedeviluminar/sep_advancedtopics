import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  final data;
   UserHome({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var name = data[0]['name'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $name"),
        elevation: 5,
      ),
    );
  }
}
