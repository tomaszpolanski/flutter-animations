import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/pages/root_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('$RootPage is the initial page', (tester) async {
    await tester.pumpWidget(
      const AnimationCheatSheet(
        config: Configuration(),
      ),
    );

    expect(find.byType(RootPage), findsOneWidget);
  });
}
