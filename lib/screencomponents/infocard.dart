import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:moves/screencomponents/themes.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';

class AnimateExpanded extends StatefulWidget {
  final String companyName;
  final String ticker;
  final String purchaseSize;
  final String strikePrice;
  final String expiration;
  final String placementDate;

  AnimateExpanded(
      {this.companyName,
      this.ticker,
      this.purchaseSize,
      this.strikePrice,
      this.expiration,
      this.placementDate});

  @override
  _AnimateExpandedState createState() => _AnimateExpandedState();
}

class _AnimateExpandedState extends State<AnimateExpanded>
    with TickerProviderStateMixin {
  double _bodyHeight = 0.0;
  bool isOpen = false;

  Animation<double> _rotateAnimation;
  AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    _rotateController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: _rotateController, curve: Curves.decelerate),
    );
  }

  @override
  void dispose() {
    _rotateController.dispose();
    super.dispose();
  }

  topButton() {
    return IconButton(
      icon: Icon(Icons.keyboard_arrow_down),
      onPressed: () {
        setState(() {
          switch (_rotateController.status) {
            //switch case needed so that the user can't break the animation by tapping on it very fast.
            case AnimationStatus.forward:
              _rotateController.reverse();
              break;
            case AnimationStatus.reverse:
              _rotateController.forward();
              break;
            case AnimationStatus.dismissed:
              _rotateController.forward();
              break;
            case AnimationStatus.completed:
              _rotateController.reverse();
              break;
          }
          if (isOpen == false) {
            isOpen = true;
            _bodyHeight = 300.0;
          } else {
            isOpen = false;
            _bodyHeight = 0.0;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 5.0,
            child: Container(
              height: MediaQuery.of(context).size.height * .085,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AnimatedBuilder(
                      // rotates the top icon
                      animation: _rotateAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _rotateController.value * 1.0 * math.pi,
                          child: topButton(),
                        );
                      }),
                ],
              ),
            ),
          ),
          Card(
            child: AnimatedContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    //rotates the bottom icon
                    icon: Icon(Icons.keyboard_arrow_up),
                    onPressed: () {
                      setState(() {
                        _bodyHeight = 0.0;
                        isOpen = false;
                        switch (_rotateController.status) {
                          case AnimationStatus.forward:
                            _rotateController.reverse();
                            break;
                          case AnimationStatus.reverse:
                            _rotateController.forward();
                            break;
                          case AnimationStatus.dismissed:
                            _rotateController.forward();
                            break;
                          case AnimationStatus.completed:
                            _rotateController.reverse();
                            break;
                        }
                      });
                    },
                  ),
                ],
              ),
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              height: _bodyHeight,
              // color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

Widget infoCard(BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("search");
      },
      child: Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.09,
              0.0, MediaQuery.of(context).size.width * 0.09, 0.0),
          child: Card(
            elevation: 10.0,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.1458,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.024,
                          MediaQuery.of(context).size.height * 0.00645,
                          0.0,
                          0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "3.1M Bet Against Apple Inc.",
                            style: titleStyle1(),
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
                    height: MediaQuery.of(context).size.height * .0774,
                    width: MediaQuery.of(context).size.width * .12153,
                    alignment: Alignment(
                        0.0, MediaQuery.of(context).size.height * -0.00451),
                    child: IconButton(
                      icon: Icon(Icons.bookmark_border),
                      color: Colors.black,
                      onPressed: () {
                        print(MediaQuery.of(context).size.width);
                        print(MediaQuery.of(context).size.height);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )));
}

Widget searchCard(BuildContext context) {
  return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("stockdetails");
      },
      child: Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.035,
              0.0, MediaQuery.of(context).size.width * 0.035, 0.0),
          child: Card(
            elevation: 10.0,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.1458,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.024,
                          MediaQuery.of(context).size.height * 0.00645,
                          0.0,
                          0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "3.1M Bet Against Apple Inc.",
                            style: titleStyle1(),
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
                    height: MediaQuery.of(context).size.height * .0774,
                    width: MediaQuery.of(context).size.width * .12153,
                    alignment: Alignment(
                        0.0, MediaQuery.of(context).size.height * -0.00451),
                    child: IconButton(
                      icon: Icon(Icons.bookmark_border),
                      color: Colors.black,
                      onPressed: () {
                        print(MediaQuery.of(context).size.width);
                        print(MediaQuery.of(context).size.height);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )));
}
