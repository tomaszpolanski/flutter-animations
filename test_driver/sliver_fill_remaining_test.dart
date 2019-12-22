import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/tests/src/test_properties.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'tools/driver.dart';

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
      await restart(
        driver,
        config: const Configuration(
          route: Routes.slivers_fill_remaining_example,
          repeatAnimations: false,
        ),
      );
    });

    test('shows sliver', () async {
      await driver.waitFor(find.byType('FillRemainingPage'));
    });
  });
}
