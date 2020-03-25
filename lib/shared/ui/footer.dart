import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/shared/lists.dart';
import 'package:animation_cheat_page/shared/system.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTextStyle.merge(
      child: Container(
        color: theme.primaryColor,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _Button(
              onPressed: () => Navigator.of(context).pushNamed(Routes.content),
              icon: Icons.all_inclusive,
              child: Text(
                'Content',
                style: theme.textTheme.headline6.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            _Button(
              onPressed: () => Navigator.of(context).pushNamed(Routes.licenses),
              icon: Icons.copyright,
              child: const Text('Licenses'),
            ),
            if (System.isMobile || System.isWeb || System.isMacOS)
              _Button(
                onPressed: () async {
                  await launch(
                    'https://github.com/tomaszpolanski/flutter-animations/issues/new',
                  );
                },
                icon: Icons.feedback,
                child: const Text('Suggestions'),
              )
          ]
              .joinEx(
                Container(
                  height: 20,
                  width: 2,
                  color: Colors.white,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required this.onPressed,
    @required this.icon,
    @required this.child,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 5),
          DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.white,
                ),
            child: child,
          ),
        ],
      ),
    );
  }
}
