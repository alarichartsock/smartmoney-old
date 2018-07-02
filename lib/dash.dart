import 'package:flutter/material.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {

  List<bool> _data = List<bool>();

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          "moves",
          style: TextStyle(fontSize: 27.5, fontWeight: FontWeight.w700),
        ),
        leading: Icon(
          Icons.menu,
          size: 35.0,
        ),
        actions: <Widget>[
          Icon(
            Icons.person,
            size: 35.0,
          )
        ],
      ),
      body: 
        ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: Container(
                padding: EdgeInsets.all(32.0),
                child: Text("$index: 7.9 M 7/29 APPL 100.5 Call", style: TextStyle(fontSize: 20.0),)
              ),
            );
          }
        ),
    );
  }
}
