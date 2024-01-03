import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/shared_preferencesss/login_and_registration/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    home: LoginShared(),
  ));
}

class LoginShared extends StatefulWidget {
  @override
  State<LoginShared> createState() => _LoginSharedState();
}

class _LoginSharedState extends State<LoginShared> {
  var formkey = GlobalKey<FormState>();
  var uname_controller = TextEditingController();
  var pass_controller = TextEditingController();
  late SharedPreferences preferences;
  late bool newUser;

  @override
  void initState() {
    check_if_user_is_already_Login();
    super.initState();
  }

// whenever we open the app check the user is logged in or not so we should create this method inside initState
  void check_if_user_is_already_Login() async {
    preferences = await SharedPreferences.getInstance();
    // ?? - if the given condition is null second statement will execute
    //the key "newUser" will creates only when we click on login button .. before that it will be null
    newUser = preferences.getBool('newUser') ?? true;

    if (newUser == false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Shared_Home()));
    }
  }

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
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "email"),
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
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "password"),
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
              ElevatedButton(
                  onPressed: () {
                    var valid = formkey.currentState!.validate();
                    if (valid == true) {
                      validateInput();
                    }
                  },
                  child: const Text("Login")),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Register_Shared()));
                  },
                  child: const Text("Not a User?? Register Here!!!"))
            ],
          ),
        ),
      ),
    );
  }

  void validateInput() async {
    String uname = uname_controller.text;
    String pwd = pass_controller.text;
    preferences = await SharedPreferences.getInstance();
    //if a user is logged in then mark it as not a new user
    preferences.setBool('newUser', false);

    // read the registered values
    String? stored_uname = preferences.getString("username");
    String? stored_pass = preferences.getString("pass");

    if (stored_uname == uname && stored_pass == pwd) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Shared_Home()));
    }
  }
}
