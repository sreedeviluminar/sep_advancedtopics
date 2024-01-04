import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/login%20and%20registration/sq_registration.dart';

class Sq_Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Email"),
                validator: (email) {
                  if (email!.isEmpty || !email.contains("@")) {
                    return "Invalid username or field is empty";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Password"),
                validator: (pass) {
                  if (pass!.isEmpty || pass.length < 6) {
                    return "Password length should be > 6 or field is empty";
                  }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text("Login Now")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Sq_Register()));
                },
                child: Text("Register Here")),
          ],
        ),
      ),
    );
  }
}
