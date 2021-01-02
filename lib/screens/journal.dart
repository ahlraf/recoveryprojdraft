import 'package:flutter/material.dart';
import 'package:onestep/shared/constants.dart';

//import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      accentColor: Colors.pink,
      primaryColor: Colors.pink[200],
      primaryColorDark: Colors.pink,
    ),
    home: ThirdRoute(),
  ));
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class ThirdRoute extends StatefulWidget {
  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
      'Triggers today',
      Icon(Icons.arrow_forward),
    ),
    const Item(
      'Patterns you noticed',
      Icon(Icons.arrow_forward),
    ),
    const Item(
      'Victories',
      Icon(Icons.arrow_forward),
    ),
    const Item(
      'Tips for tomorrow',
      Icon(Icons.arrow_forward),
    ),
    const Item(
      'Distraction strategies',
      Icon(Icons.arrow_forward),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[700],
            title: Text(
              'Journal entry options',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: DropdownButton<Item>(
              hint: Text('Select entry'),
              value: selectedUser,
              onChanged: (Item Value) {
                setState(() {
                  selectedUser = Value;
                });
              },
              items: users.map((Item user) {
                return DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      user.icon,
                      SizedBox(width: 10),
                      Text(
                        user.name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          )),
    );
  }
}
