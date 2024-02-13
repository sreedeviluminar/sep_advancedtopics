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
          title: Text('Responsive UI Example'),
        ),
        body: ResponsiveLayout(),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust the layout based on screen width
        if (constraints.maxWidth > 600) {
          // Wide layout with two columns
          return WideLayout();
        } else {
          // Narrow layout with a single column
          return NarrowLayout();
        }
      },
    );
  }
}

class WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.red,
            height: 200.0,
            child: Center(
              child: Text(
                'Column 1',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            color: Colors.blue,
            height: 200.0,
            child: Center(
              child: Text(
                'Column 2',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          height: 200.0,
          child: Center(
            child: Text(
              'Column 1',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          height: 200.0,
          child: Center(
            child: Text(
              'Column 2',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
