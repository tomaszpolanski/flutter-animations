import 'dart:convert';

import 'package:animation_cheat_page/config.dart';
import 'package:fast_flutter_driver/fast_flutter_driver.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(List<String> args) {
  group('Sliver Fill Remaining', () {
    FlutterDriver driver;
    final properties = TestProperties(args);

    setUpAll(() async {
      driver = await FlutterDriver.connect(dartVmServiceUrl: properties.vmUrl);
    });

    tearDownAll(() async {
      await driver?.close();
    });

    setUp(() async {
      await driver.requestData(
        json.encode(
          Configuration(
            route: Routes.slivers_fill_remaining_example,
            repeatAnimations: false,
            resolution: properties.resolution,
          ),
        ),
      );
    });

    test('shows sliver', () async {
      await driver.waitFor(find.byType('FillRemainingPage'));
    });
  });
}
