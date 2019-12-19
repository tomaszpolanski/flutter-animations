import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:animation_cheat_page/shared/string.dart';
import 'package:animation_cheat_page/shared/ui/search_bar.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  String _searchQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        onChanged: (String value) => setState(() => _searchQuery = value),
      ),
      body: ListView(
        children: <Widget>[
          for (final route in AnimationCheatSheet.routes()
              .keys
              .where((route) => route.containsIgnoreCase(_searchQuery)))
            ListTile(
              title: Text(route),
              onTap: () => Navigator.of(context).pushNamed(route),
            )
        ],
      ),
    );
  }
}
