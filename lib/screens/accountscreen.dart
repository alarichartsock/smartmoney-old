import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  TextStyle titleStyle() {
    return TextStyle(
      fontSize: 19.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
      color: Colors.black,
      wordSpacing: 0.5,
    );
  }

  TextStyle middleStyle() {
    return TextStyle(
      fontSize: 14.5,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.0,
      color: Colors.black,
      wordSpacing: 0.5,
    );
  }

  Widget settingscard(IconData iconType, String cardInfo, String userInfo) {
    return Card(
        child: Container(
      height: 75.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Icon(
              iconType,
              size: 32.0,
            ),
          ),
          Expanded(
            child: Text(
              cardInfo,
              style: titleStyle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: Text(
              userInfo,
              style: middleStyle(),
            ),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        settingscard(Icons.person, "account", "alaric.hartsock@yahoo.com"),
        settingscard(Icons.notifications_active, "notifications", "all"),
        settingscard(Icons.attach_money, "payment", "ending in 0011"),
        settingscard(Icons.lightbulb_outline, "day/night", "day"),
        settingscard(Icons.security, "legal", "read TOS"),
        settingscard(Icons.help_outline, "help", "questions?"),
      ],
    );
  }
}
