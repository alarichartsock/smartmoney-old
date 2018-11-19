import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 75.0,
          width: 300.0,
          color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            child: TextField(
              maxLines: 1,
              style: TextStyle(fontSize: 40.0, color: Colors.white),
            ),
          ),
        ),
        Container(
            //container allows us to control for sizing of material
            height: 75.0,
            width: 75.0,
            child: Material(
              color: Colors.grey,
              child: IconButton(
                splashColor: Colors.white,
                icon: Icon(Icons.close),
                iconSize: 38.0,
                color: Colors.black,
                onPressed: () {
                  print("Quit Searchbar");
                },
              ),
            )),
      ],
    );
    
  }
}
