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

class MyPageViewBuilder extends StatefulWidget {
  @override
  _MyPageViewBuilderState createState() => _MyPageViewBuilderState();
}

class _MyPageViewBuilderState extends State<MyPageViewBuilder> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3, // Number of pages
            itemBuilder: (context, index) {
              return buildPage(index);
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              child: Text('Previous'),
            ),
            SizedBox(width: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                }
              },
              child: Text('Next'),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPage(int index) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Page ${index + 1}',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
