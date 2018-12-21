import 'package:flutter/material.dart';
import 'zoomscaffold/zoom_scaffold.dart';
import 'zoomscaffold/menu.dart';
import 'screens.dart';
import 'screens/stockinfo.dart';
import 'screens/watchlist.dart';
import 'screens/search.dart';
import 'screencomponents/themes.dart';

void main() {
  runApp(MaterialApp(
      home: Dash(), //entry function
      title: "Hello",
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "stockdetails": (BuildContext context) => StockDetails(),
        "dash": (BuildContext context) => Dash(),
        "search" : (BuildContext context)  => Search(),
      }));
}

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  var activeScreen = browse;
  var selectedMenuId = '1';

  final menu = Menu(items: [

    MenuItem(id: '1', title: 'browse'),
    MenuItem(id: '2', title: 'watchlist'),
    MenuItem(id: '3', title: 'insiders'),
    MenuItem(id: '4', title: 'settings'),
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
            setState(() => activeScreen = browse);
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
