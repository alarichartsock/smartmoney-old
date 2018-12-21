import 'package:moves/screencomponents/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:moves/screencomponents/donutchart.dart';
import 'package:moves/screencomponents/themes.dart';


class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.blue, b: color.blue, a: color.alpha);
}

class StockDetails extends StatefulWidget {
  @override
  _StockDetailsState createState() => _StockDetailsState();
}

class _StockDetailsState extends State<StockDetails> {
  List<double> mockData = [1.0, 6.0, 4.0, 3.0, 8.0, 6.0, 4.0, 6.0, 3.0];

  Widget timePeriod(String timeInterval) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all()),
        height: 20.0,
        width: 35.0,
        child: Center(
          child: Text(
            timeInterval,
            style: middleStyle(),
          ),
        ),
      ),
    );
  }

  Widget infoCard() {
    return Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.0364,
            0.0, MediaQuery.of(context).size.width * 0.0364, 0.0),
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
                    icon: Icon(Icons.bookmark),
                    color: Colors.black,
                    onPressed: () {
                      print(MediaQuery.of(context).size.width);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }

// const Color(0xFFffffff), const Color(0xFFdfe9f3)

  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('2016', 12, Colors.red),
      ClicksPerYear('2017', 42, Colors.yellow),
      ClicksPerYear('2018', 24, Colors.black),
    ];

    var series = [
      charts.Series(
        id: 'Clicks',
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        data: data,
      ),
    ];

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xffffffff), const Color(0xFFdfe9f3)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Apple Inc.",
                    style: titleStyle1(),
                  ),
                  Text(
                    "NYSE - APPL",
                    style: middleStyle(),
                  )
                ],
              ),
            ),
            leading: IconButton(
              onPressed: () {
                print("going back to dash");
                Navigator.pop(context);
                },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.remove_red_eye),
                color: Colors.black,
                onPressed: () {
                  print("stock is on watchlist now");
                },
              )
            ],
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.11,
                    MediaQuery.of(context).size.height * .038,
                    MediaQuery.of(context).size.width * 0.11,
                    0.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.257,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(border: Border.all(), color: Colors.white),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                        child: Sparkline(
                          lineColor: Colors.black,
                          data: mockData,
                          fillMode: FillMode.below,
                          fillGradient: LinearGradient(
                            begin: Alignment(0.0, -1.4),
                            end: Alignment(0.0, 1.0),
                            colors: [Colors.green, Colors.white],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              r"$120.53",
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.5,
                                  color: Colors.black,
                                  wordSpacing: 0.5),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                              child: Icon(
                                MyFlutterApp.asset_1,
                                color: Colors.green,
                                size: 14.0,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                              child: Text(
                                "0.09%",
                                style: middleStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment(0.0, 1.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "more info",
                                style: middleStyle(),
                              ),
                            ),
                            IconButton(
                              //TODO: render inkwell ontop.
                              icon: Icon(Icons.keyboard_arrow_down),
                              onPressed: () {
                                print("More info pressed");
                                //todo: i'm going to basically turn this container into an expanded box. reference lib/screencomponents/expandedcard.dart
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  timePeriod("1D"),
                  timePeriod("1W"),
                  timePeriod("1M"),
                  timePeriod("3M"),
                  timePeriod("1Y"),
                  timePeriod("5Y"),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "% short",
                          style: titleStyle1(),
                        ),
                        SizedBox(
                          height: 150.0,
                          width: 150.0,
                          child: DonutPieChart(
                            series,
                            animate: true,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "% for",
                          style: titleStyle1(),
                        ),
                        SizedBox(
                          height: 150.0,
                          width: 150.0,
                          child: DonutPieChart(
                            series,
                            animate: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ), //row
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 10.0),
                    child: Text(
                      "Strange Trades",
                      style: titleStyle1(),
                    ),
                  ),
                  infoCard(),
                  infoCard(),
                  infoCard(),
                ],
              ),
            ],
          ),
        ));
  }
}
