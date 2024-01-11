import 'package:flutter/material.dart';

class Second_Page_Animation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(" Go back to Main Page")),
      ),
    );
  }
}
