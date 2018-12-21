import 'package:flutter/material.dart';

lightTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 25.0,
      opacity: 1.0
    ),
    unselectedWidgetColor: Colors.black,
    buttonColor: Colors.black,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      highlightColor: Colors.black,
    )
  );
}

TextStyle middleStyle() {
  return TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.0,
    color: Colors.black,
    wordSpacing: 0.5,
  );
}

TextStyle titleStyle1() {
  return TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: Colors.black,
    wordSpacing: 0.5,
  );
}

TextStyle titleStyle2() {
  return TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: Colors.black,
    wordSpacing: 0.5,
  );
}
TextStyle titleStyle3() {
  return TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: Colors.black,
    wordSpacing: 0.5,
  );
}

TextStyle spacedTitleStyle() {
  return TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.0,
    color: Colors.black,
    wordSpacing: 0.25,
  );
}
