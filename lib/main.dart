// lib/main.dart
import 'package:flutter/material.dart';
import 'package:herbal_gallary/home_screen.dart';
//import '../lib/home_screen.dart'

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.green,
    ),
    themeMode: ThemeMode.system,
    home: const HomeScreen(),
  ));
}
