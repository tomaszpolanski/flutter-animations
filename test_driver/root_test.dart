import 'package:animation_cheat_page/config.dart';
import 'package:animation_cheat_page/tests/src/test_properties.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'tools/driver.dart';

void main(List<String> args) {
  group('Root', () {
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
        config: const Configuration(route: Routes.root),
      );
    });

    test('shows root', () async {
      await driver.runUnsynchronized(
          () => driver.waitFor(find.byType('PresentationList')));
    });
  });
}
