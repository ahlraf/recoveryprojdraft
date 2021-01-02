import 'package:flutter/material.dart';
import 'package:onestep/screens/moodDiary/helpers/db_helper.dart';
import 'package:onestep/screens/moodDiary/helpers/mooddata.dart';
import 'package:onestep/screens/moodDiary/models/moodcard.dart';
import 'package:onestep/screens/moodDiary/widgets/mooddaycard.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    loader = Provider.of<MoodCard>(context, listen: true).isLoading;
    return loader
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text('Your moods'),
              backgroundColor: Colors.pink[300],
              actions: [
                IconButton(
                  icon: Icon(Icons.show_chart),
                  onPressed: () => Navigator.of(context).pushNamed('/chart'),
                ),
              ],
            ),
            body: FutureBuilder(
              future: DBHelper.getData('user_moods'),
              initialData: List(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, int position) {
                          var imageString = snapshot.data[position]['actImage'];
                          List<String> img = imageString.split('_');
                          List<String> name =
                              snapshot.data[position]['actName'].split('_');
                          Provider.of<MoodCard>(context, listen: false)
                              .activityNames
                              .addAll(name);
                          Provider.of<MoodCard>(context, listen: false)
                              .data
                              .add(MoodData(
                                snapshot.data[position]['mood'] == 'Angry'
                                    ? 1
                                    : snapshot.data[position]['mood'] == 'Happy'
                                        ? 2
                                        : snapshot.data[position]['mood'] ==
                                                'Sad'
                                            ? 3
                                            : snapshot.data[position]['mood'] ==
                                                    'Surprised'
                                                ? 4
                                                : snapshot.data[position]
                                                            ['mood'] ==
                                                        'Loving'
                                                    ? 5
                                                    : snapshot.data[position]
                                                                ['mood'] ==
                                                            'Scared'
                                                        ? 6
                                                        : 7,
                                snapshot.data[position]['date'],
                                snapshot.data[position]['mood'] == 'Angry'
                                    ? charts.ColorUtil.fromDartColor(Colors.red)
                                    : snapshot.data[position]['mood'] == 'Happy'
                                        ? charts.ColorUtil.fromDartColor(
                                            Colors.pink[100])
                                        : snapshot.data[position]['mood'] ==
                                                'Sad'
                                            ? charts.ColorUtil.fromDartColor(
                                                Colors.blue[800])
                                            : snapshot.data[position]['mood'] ==
                                                    'Surprised'
                                                ? charts.ColorUtil.fromDartColor(
                                                    Colors.yellow[300])
                                                : snapshot.data[position]
                                                            ['mood'] ==
                                                        'Loving'
                                                    ? charts.ColorUtil.fromDartColor(
                                                        Colors.purple)
                                                    : snapshot.data[position]
                                                                ['mood'] ==
                                                            'Scared'
                                                        ? charts.ColorUtil.fromDartColor(
                                                            Colors.black)
                                                        : charts.ColorUtil.fromDartColor(
                                                            Colors.white),
                              ));
                          return MoodDay(
                              snapshot.data[position]['image'],
                              snapshot.data[position]['datetime'],
                              snapshot.data[position]['mood'],
                              img,
                              name);
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          );
  }
}
