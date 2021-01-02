import 'package:flutter/material.dart';
import 'package:onestep/screens/home.dart';
import 'package:onestep/screens/journal.dart';
import 'package:onestep/screens/calendar.dart';
import 'package:onestep/screens/moodDiary/mood_diary_main.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      //'/first': (context) => HomeRoute(),
      '/second': (context) => SecondRoute(),
      '/third': (context) => ThirdRoute(),
      '/fourth': (context) => FourthRoute(),
      '/fifth': (context) => MyHomePage(),
    },
  ));
}
