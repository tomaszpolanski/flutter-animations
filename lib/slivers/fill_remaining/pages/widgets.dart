import 'package:animation_cheat_page/slivers/fill_remaining/pages/fill_overscroll.dart';
import 'package:animation_cheat_page/slivers/fill_remaining/pages/has_scroll_body.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';
import 'package:flutter/widgets.dart';

final widgetExamples = <dynamic, Example>{
  SliverFillRemaining: Example(
    released: DateTime.utc(2019, 11, 5),
    title: 'SliverFillRemaining',
    body: const Text('This Widget is irreplaceable when you want to '
        'center your content even if there is not enough space for it'),
    url: 'master/lib/slivers/fill_remaining/pages/sliver_fill_remaining.dart',
    builder: (animation, child) => child,
  ),
  FillOverscrollPage: Example(
    released: DateTime.utc(2019, 12, 20),
    title: 'fillOverscroll',
    body: const Text('Demonstration how fillOverscroll works'),
    url: 'master/lib/slivers/fill_remaining/pages/fill_overscroll.dart',
    builder: (animation, child) => child,
  ),
  HasScrollBodyPage: Example(
    released: DateTime.utc(2019, 12, 20),
    title: 'hasScrollBody',
    body: const Text('Demonstration how hasScrollBody works'),
    url: 'master/lib/slivers/fill_remaining/pages/has_scroll_body.dart',
    builder: (animation, child) => child,
  ),
};
