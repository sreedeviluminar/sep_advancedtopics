import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/login%20and%20registration/sq_login.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/login%20and%20registration/sql_functionn.dart';

void main() {
  runApp(MaterialApp(
    home: Sq_Register(),
  ));
}

class Sq_Register extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var name_cntrl = TextEditingController();
  var email_cntrl = TextEditingController();
  var pass_cntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void registerUser(String name, String email, String password) async {
      var id = await SQL_Functions.addUser(
          name, email, password); // id that return when we add new users
      print(id);
      if (id != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Sq_Login()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Registration Failed")));
      }
    }

    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: name_cntrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: email_cntrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email"
                  ),
                  validator: (email){
                    if(email!.isEmpty || !email.contains("@")){
                      return "Invalid username or field is empty";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: pass_cntrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password"
                  ),
                  validator: (pass){
                    if(pass!.isEmpty || pass.length < 6){
                      return "Password length should be > 6 or field is empty";
                    }
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () async{
                    var valid = formkey.currentState!.validate();
                    if (valid == true){
                      var users = await SQL_Functions.checkUser_already_registered(email_cntrl.text);

                      registerUser(
                          name_cntrl.text, email_cntrl.text, pass_cntrl.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please Verify All the Fields")));
                    }
                  },
                  child: const Text("Register Now"))
            ],
          ),
        ),
      ),
    );
  }
}
