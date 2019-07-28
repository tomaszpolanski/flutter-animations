import 'package:animation_cheat_page/transitions/all_transitions.dart';

import 'cross_fade.dart';

final allAnimatedWidgets = [
  Example(
    title: 'AnimatedCrossFade',
    body: 'Cross-fades between two children',
    url: 'master/lib/animated_widgets/cross_fade.dart',
    builder: (_, child) => CrossFadeExample(
      child: child,
    ),
  ),
];
