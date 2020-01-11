import 'dart:convert';

import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:animation_cheat_page/config.dart';
import 'package:fast_flutter_driver/src/shared/restart_widget.dart';
import 'package:fast_flutter_driver/src/src/driver_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  timeDilation = 0.2;
  enableFlutterDriverExtension(
    handler: (playload) =>
        configureTest(Configuration.fromJson(json.decode(playload))),
  );

  runApp(
    RestartWidget(
      builder: (_, Configuration config) => AnimationCheatSheet(config: config),
    ),
  );
}
