import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
    home: testing(), //entry function
    title: "Hello",
    debugShowCheckedModeBanner: false,
  ));
}

class testing extends StatefulWidget {
  @override
  _testingState createState() => _testingState();
}

class _testingState extends State<testing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}