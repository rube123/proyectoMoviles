import 'package:flutter/material.dart';
import 'package:flutter_application_1/screeens/home_screen.dart';
import 'package:flutter_application_1/screeens/login_screen.dart';
import 'package:flutter_application_1/utils/colors_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {"/home": (context) => HomeScreen()},
      title: 'Material app',
      home: LoginScreen(),
    );
  }

  miEvento() {}
}
