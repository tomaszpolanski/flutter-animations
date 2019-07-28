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

const description = 'Transitions are in most cases the most performant way '
    'for creating animations. '
    'They required an Animation object to be passed to them '
    '- this is usually just an AnimationController.'
    '\nThe benefit of using Transitions it that they usually work on render '
    'objects so the widgets and elements that are animated do not need '
    'to perform rebuild.';
final released = DateTime.utc(2019, 7, 22);
final allTransitions = [
  Example(
    released: released,
    title: 'SlideTransition',
    body: "Slide transition moves widget X times of it's dimention.",
    url: 'master/lib/transitions/slide.dart',
    builder: (animation, child) => SlideExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'ScaleTransition',
    body: 'Scale transition changes the size of the widget.',
    url: 'master/lib/transitions/scale.dart',
    builder: (animation, child) => ScaleExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'RotationTransition',
    body: 'Simply rotates widget X amount of times',
    url: 'master/lib/transitions/rotation.dart',
    builder: (animation, child) => RotationExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'SizeTransition',
    body: 'Uses clipping to change the visible size of the widget',
    url: 'master/lib/transitions/size.dart',
    builder: (animation, child) => SizeExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'FadeTransition',
    body: "Changes opacity of the render box, therefore it's more performant "
        'than using normal Opacity widget',
    url: 'master/lib/transitions/fade.dart',
    builder: (animation, child) => FadeExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'PositionedTransition',
    body: 'Moves widget around Stack therefore this widget has to be in '
        'a Stack',
    url: 'master/lib/transitions/positioned.dart',
    builder: (animation, child) => PositionedExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'RelativePositionedTransition',
    body: 'Similar to PositionedTransition but positions widget relatively to '
        'a bounding box with the specified size',
    url: 'master/lib/transitions/relative_positioned.dart',
    builder: (animation, child) => RelativePositionedExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'DecoratedBoxTransition',
    body: 'A really interesting transition that allows a bunch of transtions. '
        '\nIMPORTANT: Might not work with widgets that already use box '
        'decorations like Container and Material!!',
    url: 'master/lib/transitions/decorated_box.dart',
    builder: (animation, child) => DecoratedBoxExample(
      animation: animation,
    ),
  ),
  Example(
    released: released,
    title: 'AlignTransition',
    body: 'Wanna change the alignment to the parent? This is the perfect'
        ' widget!',
    url: 'master/lib/transitions/align.dart',
    builder: (animation, child) => AlignExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    released: released,
    title: 'DefaultTextStyleTransition',
    body: 'Amazing for animating all the text styles!',
    url: 'master/lib/transitions/default_text_style.dart',
    builder: (animation, child) => DefaultTextStyleExample(
      animation: animation,
    ),
  ),
];

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
  final String body;
  final String _url;
  final Widget Function(Animation<double> animation, Widget child) builder;

  String get pageUrl => '$rootUrl/$_url';

  String get fileUrl => '$rawUrl/$_url';
}
