import 'package:calc/screens/calc.dart';
import 'package:flutter/material.dart';
import 'package:calc/utilities/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: dark,
      theme: light,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const Calc(),
    );
  }
}
