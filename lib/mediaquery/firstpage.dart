import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: mainPageMedia(),
  ));
}

class mainPageMedia extends StatelessWidget {
  bool? isLargeScreen;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    isLargeScreen = width > 600;
    return Scaffold(
        body: isLargeScreen == true ?
        BigScreen() : MobileScreen());
  }
}

class MobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Screen"),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(color: Colors.greenAccent),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.pink.shade50,
                  child: Text("Video $index"),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class BigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Big Screen"),
        backgroundColor: Colors.red,
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        color: Colors.green.shade50,
                        child: Text("Video $index"),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.orange,
                  child: Text("Video $index"),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
