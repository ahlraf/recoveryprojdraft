import 'package:charts_flutter/flutter.dart' as charts;

class MoodData {
  String date;
  int moodNumber;
  final charts.Color barColor;

  MoodData(this.moodNumber, this.date, this.barColor);
}
