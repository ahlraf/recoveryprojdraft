import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'dart:async';
import 'package:intl/intl.dart';

class HomeRoute extends StatelessWidget {
  dynamic currentTime = DateFormat.yMMMd().format(new DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '$currentTime',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'NotoSerif',
            fontSize: 50.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[200],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/thisisit.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 800.0, 0, 0),
              child: Row(
                children: [
                  RaisedButton(
                    color: Colors.pink[100],
                    child: Text(
                      'CALENDAR',
                      style: TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                    },
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontFamily: 'NotoSerif',
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  RaisedButton(
                    color: Colors.pink[100],
                    child: Text(
                      'JOURNAL',
                      style: TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/third');
                    },
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontFamily: 'NotoSerif',
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  RaisedButton(
                    color: Colors.pink[100],
                    child: Text(
                      'MOOD TRACKER',
                      style: TextStyle(
                        fontFamily: 'NotoSerif',
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/fourth');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
