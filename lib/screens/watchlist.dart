import 'package:flutter/material.dart';
import 'package:moves/screencomponents/themes.dart';
import 'package:moves/screencomponents/infocard.dart';

class Watchlist extends StatefulWidget {
  @override
  _WatchlistState createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        watchlistSelector(),
        watchlistItems(),
      ],
    );
  }

  Widget watchlistItems() {
    return Container(
        width: double.infinity,
        color: Colors.transparent,
        height: 610.0,
        child: ListView(
          children: <Widget>[
            searchCard(context),
            searchCard(context),
            searchCard(context),
          ],
        ));
  }

  Widget watchlistSelector() {
    return Column(children: <Widget>[
      Stack(children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200.0,
                  color: Colors.transparent,
                  height: 40.0,
                  child: Center(
                    child: Text("stocks", style: titleStyle2()),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 200.0,
                  color: Colors.transparent,
                  height: 40.0,
                  child: Center(
                    child: Text("trades", style: titleStyle2()),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          transform: Matrix4.translationValues(74.0, 35.0, 0.0),
          color: Colors.black,
          height: 1.5,
          width: 64.0,
        ),
      ]),
      Padding(
          padding: EdgeInsets.fromLTRB(50.0, 2.5, 50.0, 15.0),
          child: Container(
            height: 2.5,
            width: double.infinity,
            color: Colors.black,
          )),
    ]);
  }
}
