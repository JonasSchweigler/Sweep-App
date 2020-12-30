import 'package:flutter/material.dart';

class Requirements extends StatefulWidget {
  @override
  _RequirementsState createState() => _RequirementsState();
}

class _RequirementsState extends State<Requirements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: 200,
        height: 500,
        child: FlatButton(
          color: Colors.red,
        ),
      ),
    );
  }
}
