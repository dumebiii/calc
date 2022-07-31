import 'package:flutter/material.dart';

ThemeData dark = ThemeData.dark().copyWith(
  primaryColor: const Color(0xff414141),
  scaffoldBackgroundColor: const Color(0xff2a2a2a),
  textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 35,
      ),
      headline2: TextStyle(
        color: Color(0xffffffff),
        fontFamily: 'alethiapro',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
);

ThemeData light = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xffffffff),
  primaryColor: const Color(0xffeaeaea),
  textTheme: const TextTheme(
      headline6: TextStyle(
        color: Color(0xff393939),
        fontSize: 35,
      ),
      headline2: TextStyle(
        color: Color(0xff383838),
        fontFamily: 'alethiapro',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      )),
);

TextStyle kequationstyle = const TextStyle(
    fontSize: 100, color: Color(0xff74ca61), fontFamily: 'digital-7');
