import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;

    /// It will notify all it's consumer where there is change in value.
    notifyListeners();
  }
}
