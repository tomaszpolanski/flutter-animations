import 'package:animation_cheat_page/transitions/all_transitions.dart';
import 'package:flutter/widgets.dart';

final widgetExamples = <dynamic, Example>{
  SliverFillRemaining: Example(
    released: DateTime.utc(2019, 11, 5),
    title: 'SliverFillRemaining',
    body: const Text('This Widget is irreplaceable when you want to '
        'center your content even if there is not enough space for it'),
    url: 'master/lib/widgets/sliver_fill_remaining.dart',
    builder: (animation, child) => child,
  )
};
