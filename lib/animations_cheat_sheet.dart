import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/content_page.dart';
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
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.crimsonProTextTheme(),
      ),
      initialRoute: config.route,
      onUnknownRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (_) => const NotFoundPage(),
      ),
      routes: routes(repeatAnimations: config.repeatAnimations),
    );
  }

  static Map<String, WidgetBuilder> routes({bool repeatAnimations = false}) {
    return {
      Routes.root: (_) => RootPage(repeatAnimations: repeatAnimations),
      Routes.curves: (_) => CurvesPage(repeatAnimations: repeatAnimations),
      Routes.not_found: (_) => const NotFoundPage(),
      Routes.content: (_) => const ContentPage(),
      ...slivers_constraints.pages,
      ...slivers_geometry.pages,
      ...fill_remaining.pages,
    };
  }
}

class NoOverflow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(context, child, axisDirection) => child;
}
