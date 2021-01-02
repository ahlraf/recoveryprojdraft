import 'package:flutter/cupertino.dart';
import 'package:onestep/screens/moodDiary/helpers/db_helper.dart';
import 'package:onestep/screens/moodDiary/helpers/mooddata.dart';
import 'package:onestep/screens/moodDiary/models/activity.dart';

class MoodCard extends ChangeNotifier {
  String datetime;
  String mood;
  List<String> activityName = [];
  List<String> activityImage = [];
  String image;
  String actImage;
  String actName;
  MoodCard({this.actImage, this.actName, this.datetime, this.image, this.mood});
  List items;
  List<MoodData> data = [];
  String date;
  bool isLoading = false;
  List<String> activityNames = [];

  void add(Activity act) {
    activityImage.add(act.image);
    activityName.add(act.name);
    notifyListeners();
  }

  Future<void> addPlace(
    String datetime,
    String mood,
    String image,
    String actImage,
    String actName,
    String date,
  ) async {
    DBHelper.insert('user_moods', {
      'datetime': datetime,
      'mood': mood,
      'image': image,
      'actImage': actImage,
      'actName': actName,
      'date': date,
    });
    notifyListeners();
  }

  Future<void> deletePlaces(String datetime) async {
    DBHelper.delete(datetime);
    notifyListeners();
  }
}
