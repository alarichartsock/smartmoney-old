import 'package:flutter/material.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  TextStyle titleStyle1() {
    return TextStyle(
      fontSize: 19.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.0,
      color: Colors.black,
      wordSpacing: 0.25,
    );
  }

  TextStyle titleStyle2() {
    return TextStyle(
      fontSize: 19.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.0,
      color: Colors.black,
      wordSpacing: 0.25,
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

  Widget industryBubble(String title) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 20.0),
        child: Container(
            height: 80.0,
            width: 80.0,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200.0)),
              elevation: 10.0,
              child: Center(
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  child: Center(
                    child: Text(
                      title,
                      style: titleStyle2(),
                    ),
                  ),
                ),
              ),
            )));
  }

  Widget infoCard() {
    return Padding(
        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: Card(
          elevation: 15.0,
          child: Container(
            height: 60.0,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "3.1M Bet Against Apple Inc.",
                          style: titleStyle2(),
                        ),
                        Text(
                          "12/4/2018 04:00PM",
                          style: middleStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 60.0,
                  width: 50.0,
                  alignment: Alignment(0.0, -3.5),
                  child: IconButton(
                    icon: Icon(Icons.bookmark),
                    color: Colors.black,
                    onPressed: () {
                      print("save pressed");
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  returnList1() {
    return <Widget>[
      infoCard(),
      infoCard(),
      infoCard(),
      IconButton(
        icon: Icon(Icons.more_horiz),
        iconSize: 35.0,
        color: Colors.black,
        onPressed: () {
          print("More Pressed!");
        },
      )
    ];
  }

  returnList2() {
    return <Widget>[
      infoCard(),
      infoCard(),
      infoCard(),
    ];
  }

  Widget rowDisplay(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 10.0),
          child: Text(
            title,
            style: titleStyle1(),
          ),
        ),
        Container(
          height: 110.0,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              industryBubble("1"),
              industryBubble("2"),
              industryBubble("3"),
              industryBubble("4"),
              industryBubble("5"),
              industryBubble("6"),
              industryBubble("7"),
            ],
          ),
        ),
      ],
    );
  }

  Widget columnDisplay(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 16.0),
          child: Text(
            title,
            style: titleStyle1(),
          ),
        ),
        Container(
          height: (returnList1().length - 1) * 70.0 + 55.0,
          width: double.infinity,
          child: Column(children: returnList1()),
        ),
      ],
    );
  }

  Widget viewAll() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 16.0),
              child: Text(
                "view all",
                style: titleStyle1(),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(265.0, 0.0, 0.0, 16.0),
                child: IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: () {
                    print("settings pressed");
                  },
                )),
          ],
        ),
        Container(
          height: (returnList2().length) * 70.0,
          width: double.infinity,
          child: Column(children: returnList2()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        rowDisplay("industries"),
        columnDisplay("unusual trades"),
        columnDisplay("for you"),
        rowDisplay("highest bets"),
        viewAll(),
      ],
    );
  }
}
