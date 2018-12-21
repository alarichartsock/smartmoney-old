import 'package:flutter/material.dart';
import 'screens/accountscreen.dart';
import 'screens/browse.dart';
import 'screens/watchlist.dart';
import 'screencomponents/infocard.dart';

class Screen {
  String title;
  final WidgetBuilder contentBuilder;
  final IconData icon;

  Screen({
    this.title,
    this.contentBuilder,
    this.icon,
  });
}


final Screen browse = Screen(
  title: "browse",
  contentBuilder: (BuildContext context) {
    return Browse();
  },
  icon: Icons.search,
);

//watchlist

final Screen watchlist = Screen(
    title: "watchlist",
    contentBuilder: (BuildContext context) {
      return Watchlist();
    },
    icon: Icons.add);

//insider moves

final Screen insidermoves = Screen(
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
  icon: Icons.search,
);

//account

final Screen settings = Screen(
  title: "settings",
  contentBuilder: (BuildContext context) {
    return AccountScreen();
  },
  icon: null,
);
