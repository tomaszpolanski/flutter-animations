import 'package:animation_cheat_page/animated_widgets/all_animated_widgets.dart'
    as animated;
import 'package:animation_cheat_page/curves/curves.dart' as curves;
import 'package:animation_cheat_page/curves/curves.dart';
import 'package:animation_cheat_page/curves/curves_page.dart';
import 'package:animation_cheat_page/shared/ui/description.dart';
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/shared/ui/new_section.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/shared/ui/separator.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart'
    as transitions;
import 'package:animation_cheat_page/widgets/sliver_fill_remaining.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;

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
        fontFamily: 'CrimsonPro',
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const _PresentationList(),
        CurvesPage.route: (_) => const CurvesPage(),
        SliverFillRemainingPage.route: (_) => const SliverFillRemainingPage(),
      },
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
    return const Scaffold(
      body: _AnimationProvider(),
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
      duration: const Duration(seconds: 3),
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
    if (kIsWeb) {
      html.window.open(url, 'Source Code');
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
          Align(
            child: NewSection(
              transitions: transitions.allTransitions,
              animated: animated.allAnimatedWidgets,
              curves: [curves.singleCurveExample],
            ),
          ),
          const SectionHeader(
            title: Text('Curves'),
            child: Text(curves.description),
          ),
          CurvesSection(
            animation: _controller,
            onPressed: (url) => _handleUrl(context, url),
            child: child,
          ),
          const SectionHeader(
            title: Text('Transitions'),
            child: Text(transitions.description),
          ),
          for (final example in transitions.allTransitions)
            Section(
              title: example.title,
              url: example.fileUrl,
              released: example.released,
              body: example.body,
              onPressed: () {
                _handleUrl(context, example.pageUrl);
              },
              child: example.builder(_controller, child),
            ),
          const SectionHeader(
            title: Text('Animated Widgets'),
            child: Text(animated.description),
          ),
          for (final example in animated.allAnimatedWidgets)
            Section(
              title: example.title,
              url: example.fileUrl,
              released: example.released,
              body: example.body,
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
