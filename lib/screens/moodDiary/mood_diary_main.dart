import 'package:flutter/material.dart';
import 'package:onestep/screens/moodDiary/models/activity.dart';
import 'package:onestep/screens/moodDiary/models/moodcard.dart';
import 'package:onestep/screens/moodDiary/screens/chart.dart';
import 'package:onestep/screens/moodDiary/screens/homepage.dart';
import 'package:onestep/screens/moodDiary/screens/start.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(FourthRoute());
}

class FourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MoodCard(),
      child: MaterialApp(
          title: 'Journal',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: StartPage(),
          routes: {
            '/home_screen': (context) => HomeScreen(),
            '/chart': (context) => MoodChart(),
          }),
    );
  }
}
