import 'package:animation_cheat_page/animated_widgets/align.dart';
import 'package:animation_cheat_page/animated_widgets/container.dart';
import 'package:animation_cheat_page/animated_widgets/default_text_style.dart';
import 'package:animation_cheat_page/animated_widgets/opacity.dart';
import 'package:animation_cheat_page/animated_widgets/padding.dart';
import 'package:animation_cheat_page/animated_widgets/physical_model.dart';
import 'package:animation_cheat_page/animated_widgets/positioned.dart';
import 'package:animation_cheat_page/animated_widgets/positioned_directional.dart';
import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/transitions/all_transitions.dart';

import 'cross_fade.dart';

const description = '''
are more compound, prebuild solution. They might integrate multiple animations - AnimatedContainer can animate size, colour, border, … at the same time. To create similar animation with Transitions it would require much more code.
The downside of Animated Widgets is that they are much less flexible to change and they need to be in a StatefullWidget as setState() need to be called.
Animated Widgets are in the created with Transition internally - in case you need more custom widget, just use Transitions.
''';

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
    builder: (_, child) => const PositionedExample(),
  ),
  Example(
    released: DateTime.utc(2019, 8, 2),
    title: 'AnimatedPositionedDirectional',
    body: const Text(
        'Similar widget to AnimatedPositioned but takes into account '
        'direction of the language. The order would be reversed in Arabic '
        'Hebrew and other Right-to-Left languages'),
    url: 'master/lib/animated_widgets/positioned_directional.dart',
    builder: (_, child) => const PositionedDirectionalExample(),
  ),
  Example(
    released: DateTime.utc(2019, 8, 2),
    title: 'AnimatedOpacity',
    body: const Text('Simply animates the opacity. It\'s more performant '
        'than just using Opacity widget as AnimatedOpacity does not need '
        'to rebuild the widget when animating'),
    url: 'master/lib/animated_widgets/opacity.dart',
    builder: (_, child) => AnimatedOpacityExample(child: child),
  ),
  Example(
    released: DateTime.utc(2019, 8, 3),
    title: 'AnimatedDefaultTextStyle',
    body: const Text('Animates style of the Text widgets'),
    url: 'master/lib/animated_widgets/default_text_style.dart',
    builder: (_, child) => const AnimatedDefaultTextStyleExample(),
  ),
  Example(
    released: DateTime.utc(2019, 8, 3),
    title: 'AnimatedPhysicalModel',
    body: const Text('This wiget can create shapes similar to Card widget '
        'and can animate the elevation, color and border radius'),
    url: 'master/lib/animated_widgets/physical_model.dart',
    builder: (_, child) => const AnimatedPhysicalModelExample(),
  ),
];
