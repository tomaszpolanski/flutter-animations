import 'dart:convert';

import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/tests/src/restart_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  timeDilation = 0.2;
  enableFlutterDriverExtension(
    handler: (request) async {
      final Configuration config = Configuration.fromJson(json.decode(request));
      await RestartWidget.restartApp(config);
      return null;
    },
  );
  runApp(
    RestartWidget(
      builder: (_, config) => AnimationCheatSheet(config: config),
    ),
  );
}
