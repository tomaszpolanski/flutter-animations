import 'package:animation_cheat_page/shared/interop.dart';
import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/section.dart';
import 'package:animation_cheat_page/shared/ui/description.dart';
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/shared/ui/separator.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';

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
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _headerController;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _headerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _headerController.dispose();
    super.dispose();
  }

  void _handleUrl(BuildContext context, String url) {
    if (isBrowser) {
      window.open(url, 'Source Code');
    } else {
      Clipboard.setData(ClipboardData(text: url));
      final snackBar = SnackBar(
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
          Align(
            child: Header(
              'Animations',
              animation: _headerController,
            ),
          ),
          const Align(child: Description()),
          const Align(child: Separator()),
          for (final example in allTransitions)
            Section(
              title: example.title,
              url: example.fileUrl,
              body: Text(example.body),
              onPressed: () {
                _handleUrl(context, example.pageUrl);
              },
              child: example.builder(_controller, child),
            ),
        ],
      ),
    );
  }
}
