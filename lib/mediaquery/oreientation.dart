import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyScreen());
}

class MyScreen extends  StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // theme of your device
    var isdark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return MaterialApp(
      theme: isdark == true ? ThemeData.dark():ThemeData.light(),
      home: Orientationss(),
    );
  }
}

class Orientationss extends StatelessWidget {
  var orientation;

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: orientation == Orientation.portrait
          ? const ListScreen()
          : GridScreen(),
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListScreen"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1705872599046-70e2eee1e838?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHx8"))),
          ),
        );
      }),
    );
  }
}

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Grid Screen"),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
            20,
            (index) => Container(
              height: 200,
              decoration: BoxDecoration(
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
              child: Center(
                child: Text(
                  "Grid $index",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ));
  }
}
