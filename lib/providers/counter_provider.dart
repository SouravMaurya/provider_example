import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  var _counter = 0;

  int get counter => _counter;

  void addCounter() {
    _counter++;
    notifyListeners();
  }
}
