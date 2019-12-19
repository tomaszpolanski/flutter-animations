import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          for (final route in AnimationCheatSheet.routes().keys)
            ListTile(
              title: Text(route),
              onTap: () {
                Navigator.of(context).pushNamed(route);
              },
            )
        ],
      ),
    );
  }
}
