import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/curves/curves_page.dart';
import 'package:animation_cheat_page/generic/not_found_page.dart';
import 'package:animation_cheat_page/pages/content_page.dart';
import 'package:animation_cheat_page/pages/licenses_page.dart'
    deferred as licenses;
import 'package:animation_cheat_page/pages/root_page.dart';
import 'package:animation_cheat_page/shared/deferred.dart';
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
    Key? key,
    required this.config,
  }) : super(key: key);

  final Configuration config;

  static const title = 'Flutter Animations';
  static final gKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: gKey,
      builder: (_, child) {
        return ScrollConfiguration(behavior: NoOverflow(), child: child!);
      },
      theme: ThemeData(
        textTheme: GoogleFonts.crimsonProTextTheme(),
      ),
      initialRoute: config.route,
      title: title,
      onUnknownRoute: (settings) => MaterialPageRoute<void>(
        settings: settings,
        builder: (_) => const NotFoundPage(),
      ),
      routes: routes(repeatAnimations: config.repeatAnimations),
    );
  }

  static Map<String, WidgetBuilder> routes({bool? repeatAnimations = false}) {
    return {
      Routes.root: (_) => RootPage(repeatAnimations: repeatAnimations),
      Routes.curves: (_) => CurvesPage(repeatAnimations: repeatAnimations),
      Routes.not_found: (_) => const NotFoundPage(),
      Routes.content: (_) => const ContentPage(),
      Routes.licenses: (_) => Deferred(
            future: licenses.loadLibrary(),
            // ignore: prefer_const_constructors
            builder: (_) => licenses.LicensesPage(),
          ),
      ...slivers_constraints.pages,
      ...slivers_geometry.pages,
      ...fill_remaining.pages,
    };
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
