import 'package:flutter/material.dart';

class Count_provider extends ChangeNotifier {
  int _counter = 0;
  int get count => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}