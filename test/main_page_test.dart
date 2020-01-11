import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/shared/ui/description.dart' as ui;
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Header is rendered', (tester) async {
    await tester.pumpWidget(
      const AnimationCheatSheet(
        config: Configuration(),
      ),
    );

    expect(find.byType(Header), findsOneWidget);
  });

  testWidgets('display description', (tester) async {
    await tester.pumpWidget(
      const TickerMode(
        enabled: false,
        child: AnimationCheatSheet(
          config: Configuration(),
        ),
      ),
    );

    await tester.drag(find.byType(ListView), const Offset(0, -600));
    await tester.pumpAndSettle();

    expect(find.byType(ui.Description), findsOneWidget);
  });

  testWidgets('display content', (tester) async {
    await tester.pumpWidget(
      const TickerMode(
        enabled: false,
        child: AnimationCheatSheet(
          config: Configuration(),
        ),
      ),
    );

    await tester.drag(find.byType(ListView), const Offset(0, -1600));
    await tester.pumpAndSettle();

    expect(find.byType(Section), findsWidgets);
  });
}
