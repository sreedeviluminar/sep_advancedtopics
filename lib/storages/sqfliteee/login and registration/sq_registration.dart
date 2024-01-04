import 'package:flutter/material.dart';

class Sq_Register extends StatelessWidget {
  var formkey     = GlobalKey<FormState>();
  var name_cntrl  = TextEditingController();
  var email_cntrl = TextEditingController();
  var pass_cntrl  = TextEditingController();

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
                  onPressed: (){},
                  child: const Text("Register Now")
              )

            ],
          ),
        ),
      ),
    );
  }
}
