import 'package:animation_cheat_page/config.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      width: double.infinity,
      child: DefaultTextStyle.merge(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.content),
              child: Text(
                'Content',
                style: theme.textTheme.title.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 30,
              width: 2,
              color: Colors.white,
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pushNamed(Routes.licenses),
              child: Text(
                'Licenses',
                style: theme.textTheme.title.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
