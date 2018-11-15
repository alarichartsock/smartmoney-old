import 'package:flutter/material.dart';
import 'screencomponents/animexpaned.dart';
import 'screencomponents/accountscreen.dart';

class Screen {
  final String title;
  final WidgetBuilder contentBuilder;
  final Icon icon;

  Screen({this.title, this.contentBuilder, this.icon});
}

final Screen moves = new Screen( //this information is currently unused
  title: "moves",
  contentBuilder: (BuildContext context) {
    return ListView(
      children: <Widget>[
        AnimateExpanded(
            companyName: 'apple inc',
            ticker: 'APPL',
            purchaseSize: '20.0M',
            strikePrice: '200.0',
            expiration: '7/26',
            placementDate: '5/25'),
        AnimateExpanded(
            companyName: 'apple inc',
            ticker: 'APPL',
            purchaseSize: '20.0M',
            strikePrice: '200.0',
            expiration: '7/26',
            placementDate: '5/25'),
        AnimateExpanded(
            companyName: 'apple inc',
            ticker: 'APPL',
            purchaseSize: '20.0M',
            strikePrice: '200.0',
            expiration: '7/26',
            placementDate: '5/25'),
      ],
    );
  },
  icon: Icon(
    Icons.search,
    color: Colors.black,
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
  icon: Icon(
    Icons.add,
    color: Colors.black,
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
  icon: Icon(
    Icons.search,
    color: Colors.black,
  ),
);

//account

final Screen account = new Screen(
    title: "account",
    contentBuilder: (BuildContext context) {
      return AccountScreen();
    },
    icon: Icon(
      Icons.person,
      color: Colors.black,
    ));
