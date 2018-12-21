import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moves/screencomponents/themes.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {

  Widget settingscard(IconData iconType, String cardInfo, String userInfo) {
    return Card(
        child: Container(
      height: MediaQuery.of(context).size.height * .085,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * .0243,
                0.0,
                MediaQuery.of(context).size.width * .0243,
                0.0),
            child: Icon(
              iconType,
              size: 32.0,
            ),
          ),
          Expanded(
            child: Text(
              cardInfo,
              style: titleStyle1(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0.0, 0.0, MediaQuery.of(context).size.width * .0243, 0.0),
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
