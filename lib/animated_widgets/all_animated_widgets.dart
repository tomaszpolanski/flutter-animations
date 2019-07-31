import 'package:animation_cheat_page/animated_widgets/align.dart';
import 'package:animation_cheat_page/animated_widgets/container.dart';
import 'package:animation_cheat_page/animated_widgets/padding.dart';
import 'package:animation_cheat_page/animated_widgets/positioned.dart';
import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';

import 'cross_fade.dart';

const description = 'Those animations are easier to use as and can perform '
    'more advanced animations.\nThe downside of them is that they have to be '
    'used in a StatefullWidget together with setState() method.';

final allAnimatedWidgets = [
  Example(
    released: DateTime.utc(2019, 7, 28),
    title: 'AnimatedCrossFade',
    body: const Text('Cross-fades between two children'),
    url: 'master/lib/animated_widgets/cross_fade.dart',
    builder: (_, child) => CrossFadeExample(
      child: child,
    ),
  ),
  Example(
    released: DateTime.utc(2019, 7, 28),
    title: 'AnimatedContainer',
    body: const Text(
        'Powerfull widget that allows animation of most of the properties of a normal '
        'container'),
    url: 'master/lib/animated_widgets/container.dart',
    builder: (_, child) => const ContainerExample(),
  ),
  Example(
    released: DateTime.utc(2019, 7, 29),
    title: 'AnimatedPadding',
    body: GestureDetector(
      onTap: () {
        window.open(
          'https://www.youtube.com/playlist?list=PL--PgETgAz5FGoatB9KQzbnpv0bgZqU2l',
          'Super Easy',
        );
      },
      child: const Text(
        'Wanna animate just the padding? Super Easy, Barely An Inconvenience.',
        style: TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    ),
    url: 'master/lib/animated_widgets/padding.dart',
    builder: (_, child) => const PaddingExample(),
  ),
  Example(
    released: DateTime.utc(2019, 7, 30),
    title: 'AnimatedAlign',
    body: GestureDetector(
      onTap: () {
        window.open(
          'https://www.youtube.com/playlist?list=PL--PgETgAz5FGoatB9KQzbnpv0bgZqU2l',
          'Super Easy',
        );
      },
      child: const Text(
        'Animating alignment? Super Easy, Barely An Inconvenience.',
      ),
    ),
    url: 'master/lib/animated_widgets/align.dart',
    builder: (_, child) => AlignExample(
      child: child,
    ),
  ),
  Example(
    released: DateTime.utc(2019, 7, 31),
    title: 'AnimatedPositioned',
    body: const Text(
        'This widget changes the position and size of a widget that is within a stack.\n'
        'AnimatedPositioned triggers re-layout on every animation frame so it might be expensive.\n'
        'In case you don\'t need to change the size of this widget, use something '
        'like SlideTransition which only does repaint during the animation.'),
    url: 'master/lib/animated_widgets/positioned.dart',
    builder: (_, child) => PositionedExample(),
  ),
];
