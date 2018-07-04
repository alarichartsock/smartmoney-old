import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
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
              "moves",
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
          body: ListView(
            children: [
              Card(
                elevation: 10.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/fake_chart_1.jpg',
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
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15.0)),
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
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 2.5),
                                child: Text(
                                  r"FB 150$ Put",
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w600),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                                child: Text(
                                  "7.2M @11:20AM PST, 7/20 exp",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 10.0, 0.0, 10.0),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15.0)),
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
              ),
              Card(
                elevation: 10.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/fake_chart_2.jpg',
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
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15.0)),
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
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 2.5),
                                child: Text(
                                  r"MU 50$ Put",
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w600),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                                child: Text(
                                  "3.2M @2:40PM PST, 9/40 exp",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 10.0, 0.0, 10.0),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15.0)),
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
              ),
              Card(
                elevation: 10.0,
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/fake_chart_3.jpg',
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
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15.0)),
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
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 2.5),
                                child: Text(
                                  r"IQ 150$ Call",
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w600),
                                )),
                            Padding(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                                child: Text(
                                  "7.2M @9:20AM PST, 7/15 exp",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40.0, 10.0, 0.0, 10.0),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(15.0)),
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
              ),
            ],
          ),
        ));
  }
}
