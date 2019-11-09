import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/tests/src/test_properties.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'tools/driver.dart';

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
      await restart(
        driver,
        config: const Configuration(
          route: Routes.curves,
          repeatAnimations: false,
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
