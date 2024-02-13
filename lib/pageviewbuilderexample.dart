import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PageView.builder Example'),
        ),
        body: MyPageViewBuilder(),
      ),
    );
  }
}

class MyPageViewBuilder extends StatelessWidget {
  final List<String> data = [
    'Page 1',
    'Page 2',
    'Page 3',
    'Page 4',
    'Page 5',
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return buildPage(data[index]);
      },
    );
  }

  Widget buildPage(String content) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          content,
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
