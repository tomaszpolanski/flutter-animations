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

    test('scroll', () async {
      await driver.scroll(
        find.byType('CurvesPage'),
        0,
        -400,
        const Duration(milliseconds: 100),
      );
      await driver.waitFor(find.byType('CurvesSection'));
    });
  });
}
