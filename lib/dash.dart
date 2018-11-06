import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'menu.dart';
import 'screens.dart';

class Dash extends StatefulWidget {
  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  var activeScreen = moves;
  var selectedMenuId = '1';

  final menu = Menu(items: [
    MenuItem(id: '1', title: 'moves'),
    MenuItem(id: '2', title: 'watchlist'),
    MenuItem(id: '3', title: 'insiders'),
    MenuItem(id: '4', title: 'account')
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
            setState(() => activeScreen = moves);
          } else if (itemId == '2') {
            setState(() => activeScreen = watchlist);
          } else if (itemId == '3') {
            setState(() => activeScreen = insidermoves);
          } else if (itemId == '4') {
            setState(() => activeScreen = account);
          }
        },
      ),
      contentScreen: activeScreen,
    );
  }
}
