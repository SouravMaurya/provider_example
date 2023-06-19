import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var _appTheme = ThemeData(
    primarySwatch: Colors.blue,
  );

  ThemeData? get appTheme => _appTheme;

  void changeTheme(ThemeData value) {
    _appTheme = value;
    notifyListeners();
  }
}
