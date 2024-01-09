import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/passing%20data%20between%20screens/to%20statefull/statefulScreen.dart';
import 'package:sep_advancedtopics/passing%20data%20between%20screens/to%20stateless/statelessScreen.dart';
 void main(){
   runApp(MaterialApp(home: DataHome(),));
 }
class DataHome extends StatelessWidget {
  String name = "Luminar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Passing"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Screen2(name: name,place:"Kakkanad")));
                },
                child: const Text("to Stateless Screen")),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Screen1(name: name,place:"Kakkanad")));
                }, child: const Text("to Stateful Screen")),
          ],
        ),
      ),
    );
  }
}
