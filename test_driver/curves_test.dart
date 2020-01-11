import 'dart:convert';

import 'package:animation_cheat_page/config.dart';
import 'package:fast_flutter_driver/fast_flutter_driver.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(List<String> args) {
  group('Curves', () {
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
            route: Routes.curves,
            repeatAnimations: false,
            resolution: properties.resolution,
          ),
        ),
      );
    });

    test('shows curves', () async {
      await driver.waitFor(find.byType('CurvesPage'));
    });

    test('scroll and interact', () async {
      await driver.scrollUntilVisible(
        find.byType('CurvesPage'),
        find.byValueKey('curved-examples'),
      );
      await driver.tap(find.byValueKey('left-curve'));
      await driver.tap(find.text('easeIn'));
      await driver.tap(find.byValueKey('right-curve'));
      await driver.tap(find.text('fastLinearToSlowEaseIn'));
    });
  });
}
