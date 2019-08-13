import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/network/urls.dart';
import 'package:animation_cheat_page/transitions/align.dart';
import 'package:animation_cheat_page/transitions/decorated_box.dart';
import 'package:animation_cheat_page/transitions/default_text_style.dart';
import 'package:animation_cheat_page/transitions/fade.dart';
import 'package:animation_cheat_page/transitions/positioned.dart';
import 'package:animation_cheat_page/transitions/relative_positioned.dart';
import 'package:animation_cheat_page/transitions/rotation.dart';
import 'package:animation_cheat_page/transitions/scale.dart';
import 'package:animation_cheat_page/transitions/size.dart';
import 'package:animation_cheat_page/transitions/slide.dart';

const description = '''
are lightweight and you and more clean to combine. They do not need to be placed it a StatefullWidget to work, but they need to have access Animation object (usually is an AnimationController). 
In the beginning, Transitions might be harder to use vs Animated Widgets, but in the long run, they end up with cleaner code when creating more advanced animations.
''';
final released = DateTime.utc(2019, 7, 22);
final allTransitions = [
  Example(
    released: released,
    title: 'SlideTransition',
    body:
        const Text("Slide transition moves widget X times of it's dimention."),
    url: 'master/lib/transitions/slide.dart',
    builder: (animation, child) => SlideExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'ScaleTransition',
    body: const Text('Scale transition changes the size of the widget.'),
    url: 'master/lib/transitions/scale.dart',
    builder: (animation, child) => ScaleExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'RotationTransition',
    body: const Text('Simply rotates widget X amount of times'),
    url: 'master/lib/transitions/rotation.dart',
    builder: (animation, child) => RotationExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'SizeTransition',
    body: const Text('Uses clipping to change the visible size of the widget'),
    url: 'master/lib/transitions/size.dart',
    builder: (animation, child) => SizeExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'FadeTransition',
    body: const Text(
        "Changes opacity of the render box, therefore it's more performant "
        'than using normal Opacity widget'),
    url: 'master/lib/transitions/fade.dart',
    builder: (animation, child) => FadeExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'PositionedTransition',
    body: const Text(
        'Moves widget around Stack therefore this widget has to be in '
        'a Stack'),
    url: 'master/lib/transitions/positioned.dart',
    builder: (animation, child) => PositionedExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'RelativePositionedTransition',
    body: const Text(
        'Similar to PositionedTransition but positions widget relatively to '
        'a bounding box with the specified size'),
    url: 'master/lib/transitions/relative_positioned.dart',
    builder: (animation, child) => RelativePositionedExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'DecoratedBoxTransition',
    body: const Text(
        'A really interesting transition that allows a bunch of transtions. '
        '\nIMPORTANT: Might not work with widgets that already use box '
        'decorations like Container and Material!!'),
    url: 'master/lib/transitions/decorated_box.dart',
    builder: (animation, child) => DecoratedBoxExample(
      animation: animation,
    ),
  ),
  Example(
    released: released,
    title: 'AlignTransition',
    body: const Text(
        'Wanna change the alignment to the parent? This is the perfect'
        ' widget!'),
    url: 'master/lib/transitions/align.dart',
    builder: (animation, child) => AlignExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'DefaultTextStyleTransition',
    body: const Text('Amazing for animating all the text styles!'),
    url: 'master/lib/transitions/default_text_style.dart',
    builder: (animation, child) => DefaultTextStyleExample(
      animation: animation,
    ),
  ),
];

typedef AnimatedWidgetBuilder = Widget Function(
  Animation<double> animation,
  Widget child,
);

class Example {
  const Example({
    @required this.released,
    @required this.title,
    @required this.body,
    @required String url,
    @required this.builder,
  })  : assert(released != null),
        assert(title != null),
        assert(url != null),
        assert(body != null),
        assert(builder != null),
        _url = url;

  final DateTime released;
  final String title;
  final Widget body;
  final String _url;
  final AnimatedWidgetBuilder builder;

  String get pageUrl => '$rootUrl/$_url';

  String get fileUrl => '$rawUrl/$_url';
}
