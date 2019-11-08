import 'package:animation_cheat_page/curves/curves.dart';
import 'package:animation_cheat_page/curves/curves.dart' as curves;
import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:flutter/widgets.dart';

class CurvesPage extends StatelessWidget {
  const CurvesPage({Key key, @required this.repeatAnimations})
      : super(key: key);
  final bool repeatAnimations;

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
      repeatAnimations: repeatAnimations,
      builder: (animation, child) {
        return Column(
          children: [
            const SectionHeader(
              title: Text('Curves'),
              child: Text(curves.description),
            ),
            CurvesSection(
              animation: animation,
              onPressed: (url) {},
              child: child,
            ),
          ],
        );
      },
    );
  }
}
