import 'package:flutter/material.dart';
import 'package:moves/screencomponents/customclipper.dart';
import 'package:moves/screencomponents/custompainter.dart';
import 'package:moves/screencomponents/themes.dart';
import 'package:moves/screencomponents/infocard.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  

  Widget industryBubble(String title) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.036, //left
            MediaQuery.of(context).size.height * 0.0129, //top
            0.0, //right
            MediaQuery.of(context).size.width * 0.0486), //bottom
        child: Container(
            height: MediaQuery.of(context).size.width * .103,
            width: MediaQuery.of(context).size.width * .1944,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200.0)),
              elevation: 10.0,
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.width * .103,
                  width: MediaQuery.of(context).size.width * .1944,
                  child: Center(
                    child: Text(
                      title,
                      style: titleStyle1(),
                    ),
                  ),
                ),
              ),
            )));
  }

  returnList1() {
    return <Widget>[
      infoCard(context),
      infoCard(context),
      infoCard(context),
      Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize:
                35.0, // TODO: scale icons based on mediaquery height and width
            color: Colors.black,
            onPressed: () {
              print("More Pressed!");
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.034,
                MediaQuery.of(context).size.height * 0.02839,
                0.0,
                0.0),
            child: Material(
              color: Colors.transparent,
              elevation: 7.5,
              borderRadius: BorderRadius.circular(200.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.009675,
                width: MediaQuery.of(context).size.width * 0.0559,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      )
    ];
  }

  returnList2() {
    return <Widget>[
      infoCard(context),
      infoCard(context),
      infoCard(context),
    ];
  }

  Widget rowDisplay(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.09,
              10.0,
              0.0,
              MediaQuery.of(context).size.height * 0.0129),
          child: Text(
            title,
            style: titleStyle2(),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.047, 0.0, 0.0, 0.0),
        child: Container(
          height: MediaQuery.of(context).size.height * .141,
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
        ),
      ],
    );
  }

  Widget columnDisplay(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * .09,
              0.0, 0.0, MediaQuery.of(context).size.height * .020),
          child: Text(
            title,
            style: titleStyle2(),
          ),
        ),
        Container(
          height: (returnList1().length - 1) *
                  (MediaQuery.of(context).size.height * .09) +
              (MediaQuery.of(context).size.height * .07),
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
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * .09,
                  0.0,
                  0.0,
                  MediaQuery.of(context).size.height * .02),
              child: Text(
                "view all",
                style: titleStyle2(),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * .55,
                    0.0,
                    0.0,
                    MediaQuery.of(context).size.height * .020),
                child: IconButton(
                  icon: Icon(Icons.tune),
                  onPressed: () {
                    print("settings pressed");
                  },
                )),
          ],
        ),
        Container(
          height:
              (returnList2().length) * (MediaQuery.of(context).size.height * .09),
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
        Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                height: 105.0,
                color: Colors.white,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(35.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          "Good morning Alaric",
                          style: titleStyle3()
                        ),
                      ),
                      Text(
                        "Here are some odd trades",
                        style: titleStyle1()
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomPaint(
                painter: CustomShapePainter(),
                child: Container(
                  height: 105.0,
                  width: double.infinity,
                ))
          ],
        ),
        Container(
          color: Colors.transparent,
        )
      ],
    ),
        rowDisplay("industries"),
        columnDisplay("unusual trades"),
        columnDisplay("for you"),
        rowDisplay("highest bets"),
        viewAll(),
      ],
    );
  }
}
