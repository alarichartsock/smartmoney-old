import 'package:flutter/material.dart';
import 'screencomponents/animexpaned.dart';
import 'screencomponents/accountscreen.dart';
import 'screencomponents/searchbar.dart';

class Screen {
  final String title;
  final WidgetBuilder contentBuilder;
  final IconButton iconButton;

  Screen({
    this.title,
    this.contentBuilder,
    this.iconButton,
  });
}

final Screen moves = new Screen(
  //this information is currently unused
  title: "moves",
  contentBuilder: (BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            AnimateExpanded(),
            AnimateExpanded(),
            AnimateExpanded(),
          ],
        ),
      ],
    );
  },
  iconButton: IconButton(
    icon: Icon(Icons.search),
    color: Colors.black,
    iconSize: 25.0,
    onPressed: () {
      print("search pressed");
    },
  ),
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
  iconButton: IconButton(
    icon: Icon(Icons.add),
    iconSize: 25.0,
    color: Colors.black,
    onPressed: () {
      print("add pressed");
    },
  ),
);

//insider moves

final Screen insidermoves = new Screen(
  title: "insider moves",
  contentBuilder: (BuildContext context) {
    return ListView(
      children: <Widget>[
        AnimateExpanded(),
        AnimateExpanded(),
        AnimateExpanded(),
      ],
    );
  },
  iconButton: IconButton(
    iconSize: 25.0,
    color: Colors.black,
    icon: Icon(Icons.search),
    onPressed: () {
      print("search pressed");
    },
  ),
);

//account

final Screen account = new Screen(
  title: "account",
  contentBuilder: (BuildContext context) {
    return AccountScreen();
  },
  iconButton: IconButton(
    iconSize: 25.0,
    color: Colors.black,
    icon: Icon(Icons.person),
    onPressed: () {
      print("person pressed");
    },
  ),
);

