import 'package:animation_cheat_page/transitions/all_transitions.dart';

import 'cross_fade.dart';

const description = 'Those animations are easier to use as and can perform '
    'more advanced animations.\nThe downside of them is that they have to be '
    'used in a StatefullWidget together with setState() method.';

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
