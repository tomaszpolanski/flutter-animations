import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:animation_cheat_page/config.dart';
import 'package:fast_flutter_driver/fast_flutter_driver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(
    const AnimationCheatSheet(
      config: Configuration(resolution: Resolution(1, 1)),
    ),
  );
}
