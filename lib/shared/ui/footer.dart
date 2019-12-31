import 'package:animation_cheat_page/config.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Content',
              style: theme.textTheme.subhead.copyWith(
                color: Colors.white,
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed(Routes.content),
          ),
          ListTile(
            title: Text(
              'Licenses',
              style: theme.textTheme.subhead.copyWith(
                color: Colors.white,
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed(Routes.licenses),
          ),
        ],
      ),
    );
  }
}
