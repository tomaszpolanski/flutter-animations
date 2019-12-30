import 'dart:convert';

import 'package:animation_cheat_page/animations_cheat_sheet.dart';
import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/tests/src/restart_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  // ignore: close_sinks
  final PublishSubject<Configuration> configStream = PublishSubject();
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  timeDilation = 0.1;
  enableFlutterDriverExtension(
    handler: (request) async {
      final Configuration config = Configuration.fromJson(json.decode(request));
      configStream.add(config);
      await Future<dynamic>.delayed(const Duration(milliseconds: 200));
      return null;
    },
  );
  runApp(
    RestartWidget(
      initialData: const Configuration(),
      stream: configStream,
      builder: (_, Configuration config) => AnimationCheatSheet(config: config),
    ),
  );
}
