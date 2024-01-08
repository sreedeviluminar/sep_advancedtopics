import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/login%20and%20registration/sq_admin_home.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/login%20and%20registration/sq_registration.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/login%20and%20registration/sq_user_home.dart';
import 'package:sep_advancedtopics/storages/sqfliteee/login%20and%20registration/sql_functionn.dart';


void main() {
  runApp(MaterialApp(
    home: Sq_Register(),
  ));
}
class Sq_Login extends StatelessWidget {
  var formkey     = GlobalKey<FormState>();
  var email_cntrl = TextEditingController();
  var pass_cntrl  = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void loginUser(String email, String pwd) async {
      //admin login
      if (email == 'admin@gmail' && pwd == "admin123"){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>AdminHome()));
      }else{
        //check if user is exist in db
        var data = await SQL_Functions.checkUserExist(email,pwd);

        if(data.isNotEmpty){
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context)=> UserHome(data: data)));
        }
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
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: email_cntrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email"),
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
                  controller: pass_cntrl,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Password"),
                  validator: (pass) {
                    if (pass!.isEmpty || pass.length < 6) {
                      return "Password length should be > 6 or field is empty";
                    }
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    var valid = formkey.currentState!.validate();
                    if (valid) {
                       loginUser(email_cntrl.text, pass_cntrl.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please Verify All the Fields")));
                    }
                  },
                  child: const Text("Login Now")),
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
      ),
    );
  }

}
