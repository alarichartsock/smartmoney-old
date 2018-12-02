import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'menu.dart';
import 'screens.dart';

void main() {
  runApp(
    new MaterialApp(
    home: Dash(), //entry function
    title: "Hello",
    debugShowCheckedModeBanner: false,
  ));
}

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  var activeScreen = settings; //starts on first screen by default
  var selectedMenuId = '4';

  final menu = Menu(items: [ //main menu on the left
    MenuItem(id: '1', title: 'featured'), 
    MenuItem(id: '2', title: 'watchlist'),
    MenuItem(id: '3', title: 'insiders'),
    MenuItem(id: '4', title: 'settings')
  ]);

  @override
  Widget build(BuildContext context) {
    return ZoomScaffold(
      menuScreen: MenuScreen(
        menu: menu,
        selectedItemId: selectedMenuId,
        onMenuItemSelected: (String itemId) {
          selectedMenuId = itemId;
          if (itemId == '1') {
            setState(() => activeScreen = featured);
          } else if (itemId == '2') {
            setState(() => activeScreen = watchlist);
          } else if (itemId == '3') {
            setState(() => activeScreen = insidermoves);
          } else if (itemId == '4') {
            setState(() => activeScreen = settings);
          }
        },
      ),
      contentScreen: activeScreen,
    );
  }
}
