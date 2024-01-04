import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/shared_preferencesss/login_and_registration/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register_Shared extends StatefulWidget {
  @override
  State<Register_Shared> createState() => _Register_SharedState();
}

class _Register_SharedState extends State<Register_Shared> {
  var formkey = GlobalKey<FormState>();
  var uname_controller = TextEditingController();
  var pass_controller = TextEditingController();
  var phone_controller = TextEditingController();

  late SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (username) {
                    if (username!.isEmpty || !username.contains("@")) {
                      return "Invalid or Empty UserName!!!";
                    } else {
                      return null;
                    }
                  },
                  controller: uname_controller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return "Password is empty /Password length should be > 6";
                    } else {
                      return null;
                    }
                  },
                  controller: pass_controller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder()),
                  validator: (phonenumber) {
                    if (phonenumber!.isEmpty || phonenumber.length < 10) {
                      return "phone number is empty /phone number must have 10 digits";
                    } else {
                      return null;
                    }
                  },
                  controller: phone_controller,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    var valid = formkey.currentState!.validate();
                    if (valid == true) {
                      storeData();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid Inputs!!!!")));
                    }
                  },
                  child: Text("Register"))
            ],
          ),
        ),
      ),
    );
  }

  void storeData() async {
    String email = uname_controller.text;
    String password = pass_controller.text;

    //int phone_num = phone_controller.text as int;

    int phone_num = int.parse(phone_controller.text); // convert string to integer
    preferences = await SharedPreferences.getInstance();

    preferences.setString('username', email);
    preferences.setString('pass', password);
    preferences.setInt('phone', phone_num);

    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginShared()));
  }
}
