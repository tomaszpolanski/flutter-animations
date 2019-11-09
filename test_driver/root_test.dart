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
        config: const Configuration(
          route: Routes.root,
          repeatAnimations: false,
        ),
      );
    });

    test('shows root', () async {
      await driver.waitFor(find.byType('PresentationList'));
    });

    test('scrolls to bottom', () async {
      await driver.scroll(
        find.byType('ListView'),
        0,
        -40000,
        const Duration(milliseconds: 100),
      );
      await driver.scrollUntilVisible(
        find.byType('ListView'),
        find.byType('AnimatedPhysicalModelExample'),
      );
    });
  });
}
