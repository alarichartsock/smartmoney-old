import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:moves/screencomponents/themes.dart';
import 'package:moves/screencomponents/infocard.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text("search", style: titleStyle2()),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              print("Searchbar tapped");
              searchBar.beginSearch(context);
            },
          )
        ]);
  }

  _SearchState() {
    searchBar = SearchBar(
        inBar: false,
        colorBackButton: true,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0xffffffff), const Color(0xFFdfe9f3)])),
      child: Scaffold(

        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: searchBar.build(context),
        body: Column(children: <Widget>[
          searchSelector(),
          searchResults(context),
        ]),
      ),
    );
  }
}

Widget searchResults(BuildContext context) {
  return Container(
      width: double.infinity,
      color: Colors.transparent,
      height: 610.0,
      child: ListView(
        children: <Widget>[
          searchCard(context),
          searchCard(context),
          searchCard(context),
        ],
      ));
}

Widget searchSelector() {
  return Column(children: <Widget>[
    Stack(children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 200.0,
                color: Colors.transparent,
                height: 40.0,
                child: Center(
                  child: Text("stocks", style: titleStyle2()),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 200.0,
                color: Colors.transparent,
                height: 40.0,
                child: Center(
                  child: Text("trades", style: titleStyle2()),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        transform: Matrix4.translationValues(74.0, 35.0, 0.0),
        color: Colors.black,
        height: 1.5,
        width: 64.0,
      ),
    ]),
    Padding(
        padding: EdgeInsets.fromLTRB(50.0, 2.5, 50.0, 15.0),
        child: Container(
          height: 2.5,
          width: double.infinity,
          color: Colors.black,
        )),
  ]);
}
