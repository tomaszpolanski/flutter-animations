import 'package:animation_cheat_page/shared/interop.dart';
import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class Description extends StatelessWidget {
  const Description({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        width: 600,
        child: RichText(
          text: TextSpan(style: Theme.of(context).textTheme.subhead, children: [
            const TextSpan(
              text: 'Do you need simple animation samples for Flutter?\n'
                  'I present you my set of Flutter animation code snippets. '
                  'I will keep it short, sweet and simple with loads of visual examples made with Flutter.\n'
                  'Still, it is work in progress — the catalog of samples will grow. '
                  'If you have any suggestions regarding the content, wither report them via ',
            ),
            TextSpan(
              text: 'Github',
              style: TextStyle(color: Theme.of(context).accentColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (isBrowser) {
                    window.open(
                        'https://github.com/tomaszpolanski/flutter-animations/issues',
                        'Report an issue');
                  }
                },
            ),
            const TextSpan(text: ' or '),
            TextSpan(
              text: 'Medium',
              style: TextStyle(color: Theme.of(context).accentColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (isBrowser) {
                    window.open(
                        'Flutter Animations Cheat Sheet', 'Report an issue');
                  }
                },
            ),
            const TextSpan(
                text: '.\nIn case you are interested '
                    'in a similar article about Widgets, then check out '),
            TextSpan(
              text: 'Flutter Layout Cheat Sheet',
              style: TextStyle(color: Theme.of(context).accentColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (isBrowser) {
                    window.open(
                        'https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e',
                        'Flutter Layout Cheat Sheet');
                  }
                },
            ),
            const TextSpan(text: '.\nEnjoy!'),
          ]),
        ),
      ),
    );
  }
}
