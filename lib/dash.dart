import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {

  var activeScreen = Home;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xFFffffff), const Color(0xFFdfe9f3)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              activeScreen.title,
              style: TextStyle(
                  fontSize: 27.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                onPressed: () {},
              )
            ],
          ),
          body: activeScreen.contentBuilder(context),
        )
        );
  }
}

class Screen {
  final String title;
  final WidgetBuilder contentBuilder;

  Screen({
    this.title,
    this.contentBuilder
  });
}

final Screen Home = new Screen(
  title: "Watchlist",
  contentBuilder: (BuildContext context) {
    return ListView(
            children: [
              StockCard(
                headImageAssetPath: 'assets/images/fake_chart_1.jpg',
                iconBackgroundColor: Colors.green,
                ticker: 'FB',
                strikePrice: '150',
                type: 'Put',
                volume: '7.1',
                time: '12:11 AM PST',
                exp: '7/20',
            ), StockCard(
                headImageAssetPath: 'assets/images/fake_chart_1.jpg',
                iconBackgroundColor: Colors.green,
                ticker: 'FB',
                strikePrice: '150',
                type: 'Put',
                volume: '7.1',
                time: '12:11 AM PST',
                exp: '7/20',
            ), StockCard(
                headImageAssetPath: 'assets/images/fake_chart_1.jpg',
                iconBackgroundColor: Colors.green,
                ticker: 'FB',
                strikePrice: '150',
                type: 'Put',
                volume: '7.1',
                time: '12:11 AM PST',
                exp: '7/20',
            )],
          );
  }
);

class StockCard extends StatelessWidget {

  final String headImageAssetPath;
  final Color iconBackgroundColor;
  final String ticker;
  final String strikePrice;
  final String type;
  final String volume;
  final String time;
  final String exp;

  StockCard({
    this.headImageAssetPath,
    this.iconBackgroundColor,
    this.ticker,
    this.strikePrice,
    this.type,
    this.volume,
    this.time,
    this.exp
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          Image.asset(
            headImageAssetPath,
            width: double.infinity,
            height: 160.0,
            fit: BoxFit.cover,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                  ),
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 2.5),
                      child: Text(
                          "$ticker $strikePrice" + r"$ " + "$type",
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.w600),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      child: Text(
                        "$volume M $time, $exp exp",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 10.0, 0.0, 10.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(const Radius.circular(15.0)),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    //size: 20.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
