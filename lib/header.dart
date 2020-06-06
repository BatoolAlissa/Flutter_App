import 'package:flutter/material.dart';

class MyTextLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                "Dr Sulaiman Al Habib Doctor APP",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xffB8382C),
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
