import 'package:flutter/material.dart';
import 'package:flutter_application_1/screeens/home_screen.dart';
import 'package:flutter_application_1/screeens/login_screen.dart';
import 'package:flutter_application_1/utils/colors_app.dart';
import 'package:flutter_application_1/utils/theme_app.dart';
import 'package:flutter_application_1/utils/value_listener.dart';

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
    return ValueListenableBuilder(
      valueListenable: ValueListener.isDark,
      builder: (context, value, _) {
        return MaterialApp(
          theme: value ? ThemeApp.darkTheme() : ThemeApp.lightTheme(),
          routes: {"/home": (context) => HomeScreen()},
          title: 'Material app',
          home: LoginScreen(),
        );
      },
    );
  }

  miEvento() {}
}
