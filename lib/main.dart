import 'package:flutter/material.dart';
import 'appBar.dart';
import 'header.dart';
import 'myForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'work_sans'),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(35.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyAppBar(),
                SizedBox(height: 20.0),
                MyTextLine(),
                SizedBox(height: 20.0),
                MyCustomForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
