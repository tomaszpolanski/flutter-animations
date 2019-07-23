import 'package:animation_cheat_page/shared/html.dart';
import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/section.dart';
import 'package:animation_cheat_page/transitions/scale.dart';
import 'package:animation_cheat_page/transitions/slide.dart';
import 'package:flutter/services.dart';

const bool isBrowser = identical(0, 0.0);

class AnimationCheatSheet extends StatelessWidget {
  const AnimationCheatSheet({Key key}) : super(key: key);

  static final GlobalKey gKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: gKey,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoOverflow(),
          child: child,
        );
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: const _PresentationList(),
    );
  }
}

class NoOverflow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) =>
      child;
}

class _PresentationList extends StatelessWidget {
  const _PresentationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _AnimationProvider(),
    );
  }
}

class _AnimationProvider extends StatefulWidget {
  const _AnimationProvider({Key key}) : super(key: key);

  @override
  __AnimationProviderState createState() => __AnimationProviderState();
}

class __AnimationProviderState extends State<_AnimationProvider>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleUrl(BuildContext context, String url) {
    if (isBrowser) {
      window.open(url, 'Source Code');
    } else {
      Clipboard.setData(ClipboardData(text: url));
      final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Copied link:\n$url'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    const child = Card(
      color: Colors.yellowAccent,
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Icon(
          Icons.star,
          size: 50,
        ),
      ),
    );
    return Scrollbar(
      child: ListView(
        children: [
          Section(
            title: SlideExample.title,
            body: Text(SlideExample.body),
            onPressed: () {
              _handleUrl(context, SlideExample.url);
            },
            child: SlideExample(
              animation: _controller,
              child: child,
            ),
          ),
          Section(
            title: ScaleExample.title,
            body: Text(ScaleExample.body),
            onPressed: () {
              _handleUrl(context, ScaleExample.url);
            },
            child: ScaleExample(
              animation: _controller,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
