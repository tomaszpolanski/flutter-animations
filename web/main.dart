import 'package:animation_cheat_page/main.dart' as app;
import 'package:animation_cheat_page/shared/material_import.dart' as ui;

Future<void> main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
}
