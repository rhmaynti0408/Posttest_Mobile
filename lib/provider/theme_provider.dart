// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = ThemeData(
    brightness: Brightness.light, // LightMode
    // scaffoldBackgroundColor: Colors.white,
    // primaryColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.brown),
    // [...] // more attributes
  );

  setLightMode() {
    currentTheme = ThemeData(
      brightness: Brightness.light, // LightMode
      // scaffoldBackgroundColor: Colors.white,
      // primaryColor: Colors.white,
      appBarTheme: AppBarTheme(color: Colors.brown),
      // [...] // more attributes
    );
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = ThemeData(
      brightness: Brightness.dark, // DarkMode
      // scaffoldBackgroundColor: Colors.brown,
      // [...] // more attributes
    );
    notifyListeners();
  }
}
