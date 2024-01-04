import 'package:flutter/material.dart';

class Sq_Register extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                  hintText: "Name"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
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
    );
  }
}
