import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/curves/curves_page.dart';
import 'package:animation_cheat_page/generic/not_found_page.dart';
import 'package:animation_cheat_page/root_page.dart';
import 'package:animation_cheat_page/slivers/constraints/slivers_constraints.dart'
    as slivers_constraints;
import 'package:animation_cheat_page/slivers/fill_remaining/pages.dart'
    as fill_remaining;
import 'package:animation_cheat_page/slivers/geometry/slivers_geometry.dart'
    as slivers_geometry;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimationCheatSheet extends StatelessWidget {
  const AnimationCheatSheet({
    Key key,
    @required this.config,
  }) : super(key: key);

  final Configuration config;

  static final GlobalKey gKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: gKey,
      builder: (_, child) {
        return ScrollConfiguration(behavior: NoOverflow(), child: child);
      },
      theme: ThemeData(
        fontFamily: 'CrimsonPro',
      ),
      initialRoute: config.route,
      onUnknownRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (_) => const NotFoundPage(),
      ),
      routes: {
        Routes.root: (_) => RootPage(
              repeatAnimations: config.repeatAnimations,
            ),
        Routes.curves: (_) => CurvesPage(
              repeatAnimations: config.repeatAnimations,
            ),
        ...slivers_constraints.pages,
        ...slivers_geometry.pages,
        ...fill_remaining.pages,
      },
    );
  }
}

class NoOverflow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(context, child, axisDirection) => child;
}
