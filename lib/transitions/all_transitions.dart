import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/network/urls.dart';
import 'package:animation_cheat_page/transitions/scale.dart';
import 'package:animation_cheat_page/transitions/slide.dart';

final allTransitions = [
  Example(
    title: 'SlideTransition',
    body: "Slide transition moves widget X times of it's dimention.",
    url: '$rootUrl/blob/master/lib/transitions/slide.dart',
    builder: (animation, child) => SlideExample(
      animation: animation,
      child: child,
    ),
  ),
  Example(
    title: 'ScaleTransition',
    body: 'Scale transition changes the size of the widget.',
    url: '$rootUrl/blob/master/lib/transitions/scale.dart',
    builder: (animation, child) => ScaleExample(
      animation: animation,
      child: child,
    ),
  ),
];

class Example {
  const Example({
    @required this.title,
    @required this.body,
    @required this.url,
    @required this.builder,
  })  : assert(title != null),
        assert(url != null),
        assert(body != null),
        assert(builder != null);

  final String title;
  final String body;
  final String url;
  final Widget Function(Animation<double> animation, Widget child) builder;
}
