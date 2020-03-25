import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:universal_html/html.dart' as html;

class Description extends StatelessWidget {
  const Description({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 640,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: DefaultTextStyle.merge(
        style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Do you need simple animation samples for Flutter?\n'
                'I present you my set of Flutter animation code snippets. '
                'I will keep it short, sweet and simple with loads of visual examples made with Flutter.\n'
                'Still, it is work in progress — the catalogue of samples will grow.'),
            Wrap(
              children: [
                ...'If you have any suggestions regarding the content, please report them via'
                    .split(' ')
                    .map((word) => Text('$word ')),
                GestureDetector(
                  onTap: () {
                    if (kIsWeb) {
                      html.window.open(
                        'https://github.com/tomaszpolanski/flutter-animations/issues',
                        'Report an issue',
                      );
                    }
                  },
                  child: Text(
                    'Github',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
                ...' or'.split(' ').map((word) => Text('$word ')),
                GestureDetector(
                  onTap: () {
                    if (kIsWeb) {
                      html.window.open(
                        'https://medium.com/flutter-community/flutter-animations-cheat-sheet-7f8cebfb850c',
                        'Flutter Animations Cheat Sheet',
                      );
                    }
                  },
                  child: Text(
                    'Medium',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
                const Text('.'),
              ],
            ),
            Wrap(
              children: <Widget>[
                ...'In case you are interested '
                        'in a similar article about Widgets, then check out'
                    .split(' ')
                    .map((word) => Text('$word ')),
                GestureDetector(
                  onTap: () {
                    if (kIsWeb) {
                      html.window.open(
                        'https://medium.com/flutter-community/'
                            'flutter-layout-cheat-sheet-5363348d037e',
                        'Flutter Layout Cheat Sheet',
                      );
                    }
                  },
                  child: Text(
                    'Flutter Layout Cheat Sheet',
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                ),
                const Text('.'),
              ],
            ),
            const Text('Enjoy!'),
          ],
        ),
      ),
    );
  }
}

// TODO(tomek) use this implementation whenever
// https://github.com/flutter/flutter/issues/34931 is available

// ignore: unused_element
class _Description extends StatelessWidget {
  const _Description({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: RichText(
        text: TextSpan(style: Theme.of(context).textTheme.subtitle1, children: [
          const TextSpan(
            text: 'Do you need simple animation samples for Flutter?\n'
                'I present you my set of Flutter animation code snippets. '
                'I will keep it short, sweet and simple with loads of visual examples made with Flutter.\n'
                'Still, it is work in progress — the catalog of samples will grow. '
                'If you have any suggestions regarding the content, please report them via ',
          ),
          TextSpan(
            text: 'Github',
            style: TextStyle(color: Theme.of(context).accentColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (kIsWeb) {
                  html.window.open(
                    'https://github.com/tomaszpolanski/flutter-animations/issues',
                    'Report an issue',
                  );
                }
              },
          ),
          const TextSpan(text: ' or '),
          TextSpan(
            text: 'Medium',
            style: TextStyle(color: Theme.of(context).accentColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (kIsWeb) {
                  html.window.open(
                    'https://medium.com/flutter-community/flutter-animations-cheat-sheet-7f8cebfb850c',
                    'Flutter Animations Cheat Sheet',
                  );
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
                if (kIsWeb) {
                  html.window.open(
                    'https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e',
                    'Flutter Layout Cheat Sheet',
                  );
                }
              },
          ),
          const TextSpan(text: '.\nEnjoy!'),
        ]),
      ),
    );
  }
}
