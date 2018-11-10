import 'package:flutter/material.dart';

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
  _AnimateExpandedState createState() => new _AnimateExpandedState();
}

class _AnimateExpandedState extends State<AnimateExpanded>
    with SingleTickerProviderStateMixin {

  double _bodyHeight = 0.0;
  bool isOpen = false;

  AnimationController _rotateController; //rotation for icon

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _rotateController = AnimationController(
        value: 1.0, lowerBound: 0.0, upperBound: 1.0, vsync: this, duration: Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Container(
              height: 75.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RotationTransition(
                    turns: _rotateController, 
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        //_rotateController.forward();
                        setState(() {
                          if (isOpen == false) {
                            isOpen = true;
                            this._bodyHeight = 300.0;
                            _rotateController.forward();
                          } else {
                            isOpen = false;
                            this._bodyHeight = 0.0;
                          }
                        });
                      },
                    ),
                  ),
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
                    icon: Icon(Icons.keyboard_arrow_up),
                    onPressed: () {
                      setState(() {
                        this._bodyHeight = 0.0;
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