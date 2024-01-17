import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/firebaseEx/email_password_auth/fire_function.dart';
import 'package:sep_advancedtopics/storages/firebaseEx/email_password_auth/login_fire.dart';

class Register_Fire extends StatefulWidget {
  @override
  State<Register_Fire> createState() => _Register_FireState();
}

class _Register_FireState extends State<Register_Fire> {
  var email_controller = TextEditingController();
  var pass_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        titleTextStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Register Here!!!",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: email_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Enter your email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: pass_controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Password"),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  String email = email_controller.text.trim();
                  String pass = pass_controller.text.trim();

                  FireBaseHelper().registerUser(email: email, pwd: pass).then((result) {
                    if (result == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login_Fire()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    }
                  });
                },
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
