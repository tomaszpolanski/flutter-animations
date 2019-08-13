import 'package:animation_cheat_page/curves/curves.dart';
import 'package:animation_cheat_page/curves/curves.dart' as curves;
import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';

class CurvesPage extends StatelessWidget {
  const CurvesPage({Key key}) : super(key: key);

  static const String route = '/curves';

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
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
