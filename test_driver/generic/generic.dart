import 'dart:convert';

import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:fast_flutter_driver/driver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';

import 'test_configuration.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  timeDilation = 0.1;
  enableFlutterDriverExtension(
    handler: (playload) async {
      await configureTest(
        TestConfiguration.fromJson(json.decode(playload ?? '{}')),
      );
      return '';
    },
  );

  runApp(
    RestartWidget<TestConfiguration>(
      builder: (_, config) => AnimationCheatSheet(config: config.configuration),
    ),
  );
}
