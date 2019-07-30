import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:animation_cheat_page/shared/material_import.dart';
import 'package:animation_cheat_page/shared/ui/description.dart' as ui;
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';

import 'dependencies.dart';

void main() {
  testWidgets('Header is rendered', (tester) async {
    await tester.pumpWidget(const AnimationCheatSheet());

    expect(find.byType(Header), findsOneWidget);
  });

  testWidgets('display description', (tester) async {
    await tester.pumpWidget(
      const TickerMode(
        enabled: false,
        child: AnimationCheatSheet(),
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
        child: AnimationCheatSheet(),
      ),
    );

    await tester.drag(find.byType(ListView), const Offset(0, -1600));
    await tester.pumpAndSettle();

    expect(find.byType(Section), findsWidgets);
  });
}
