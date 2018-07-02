import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  List<bool> _data = List<bool>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    setState(() {
      for (int i = 0; i < 10; i++) {
        _data.add(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          "moves",
          style: TextStyle(fontSize: 27.5, fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.person),
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          ),
        ],
      ),
      drawer: new Drawer(
          elevation: 10.0,
          semanticLabel: "drawer1",
          child: new ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: new ListTile(
                  title: new Text("pages", style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),),
                ),
              ),
              ListTile(
                title: new Text('moves', style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),),
                onTap: () {},
                dense: false,
              ),
              new ListTile(
                title: new Text('watchlist', style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),),
                onTap: () {},
              ),
              new ListTile(
                title: new Text('about',  style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),),
                onTap: () {},
              ),
            ],
          )),
      endDrawer: Drawer(
        child: new ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: new ListTile(
                  title: new Text("account", style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),),
                ),
              ),
              ListTile(
                title: new Text('settings', style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),),
                onTap: () {},
                dense: false,
              ),
              new ListTile(
                title: new Text('support', style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),),
                onTap: () {},
              ),
            ],
          )
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Text(
                    "$index: 7.9 M 7/29 APPL 100.5 Call",
                    style: TextStyle(fontSize: 20.0),
                  )),
            );
          }),
    );
  }
}
