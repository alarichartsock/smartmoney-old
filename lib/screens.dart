import 'package:flutter/material.dart';
//import 'dart:math';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    TextStyle middle() {
      return new TextStyle(
        fontSize: 17.5,
        fontWeight: FontWeight.w400,
        letterSpacing: 2.0,
        color: Colors.black,
        //height: 10.0
      );
    }

    final String firstName = 'alaric';
    final String lastName = 'hartsock';
    final String email = 'alaric.hartsock@yahoo.com';
    final String password = '*******';
    final String timeSpent = '5';
    final bool isPremium = true;

    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Icon(
                  Icons.person,
                  size: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$firstName $lastName",
                      style: middle(),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 20.0,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "$email",
                      style: middle(),
                    ),
                    Container(
                      height: 20.0,
                      width: 20.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 20.0,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "password: $password",
                      style: middle(),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 20.0,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "bill to visa ending in 0011",
                      style: middle(),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 20.0,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "thank you for choosing premium",
                      style: middle(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class Screen {
  final String title;
  final WidgetBuilder contentBuilder;
  final Icon icon;

  Screen({this.title, this.contentBuilder, this.icon});
}

final Screen moves = new Screen(
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
        //AnimateExpanded(),
        //AnimateExpanded(),
        //AnimateExpanded(),
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
        // AnimateExpanded(),
        // AnimateExpanded(),
        // AnimateExpanded(),
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
