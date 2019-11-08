import 'dart:convert';

import 'package:animation_cheat_page/config.dart';
import 'package:flutter_driver/flutter_driver.dart';

Future<void> restart(
  FlutterDriver driver, {
  Configuration config,
}) {
  return driver.requestData(config != null ? json.encode(config) : '{}');
}
