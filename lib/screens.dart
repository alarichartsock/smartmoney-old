import 'package:flutter/material.dart';
import 'screencomponents/expandedcard.dart';
import 'screens/accountscreen.dart';
import 'screens/browse.dart';

TextStyle titleStyle() {
  return TextStyle(
    fontSize: 19.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    color: Colors.black,
    wordSpacing: 0.5,
  );
}

TextStyle middleStyle() {
  return TextStyle(
    fontSize: 14.5,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.0,
    color: Colors.black,
    wordSpacing: 0.5,
  );
}


class Screen {
  String title;
  final WidgetBuilder contentBuilder;
  final String icon;

  Screen({
    this.title,
    this.contentBuilder,
    this.icon,
  });
}

final Screen browse = new Screen(
  title: "browse",
  contentBuilder: (BuildContext context) {
    return Browse();
  },
  icon: "search",
);

//watchlist

final Screen watchlist = new Screen(
    title: "watchlist",
    contentBuilder: (BuildContext context) {
      return ListView(
        children: <Widget>[
          AnimateExpanded(),
          AnimateExpanded(),
          AnimateExpanded(),
        ],
      );
    },
    icon: "add");

//insider moves

final Screen insidermoves = new Screen(
  title: "insidermoves",
  contentBuilder: (BuildContext context) {
    return ListView(
      children: <Widget>[
        AnimateExpanded(),
        AnimateExpanded(),
        AnimateExpanded(),
      ],
    );
  },
  icon: "search",
);

//account

final Screen settings = new Screen(
  title: "settings",
  contentBuilder: (BuildContext context) {
    return AccountScreen();
  },
  icon: null,
);
