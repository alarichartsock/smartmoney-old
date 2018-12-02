import 'package:flutter/material.dart';
import 'screencomponents/expandedcard.dart';
import 'screencomponents/accountscreen.dart';

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

final Screen featured = new Screen(
  title: "featured",
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
