import 'dart:convert';

import 'package:animation_cheat_page/config.dart';
import 'package:fast_flutter_driver/tool.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'generic/test_configuration.dart';

void main(List<String> args) {
  group('Root', () {
    late FlutterDriver driver;
    final properties = TestProperties(args);

    setUpAll(() async {
      driver = await FlutterDriver.connect(dartVmServiceUrl: properties.vmUrl);
    });

    tearDownAll(() async {
      await driver.close();
    });

    setUp(() async {
      await driver.requestData(
        json.encode(
          TestConfiguration(
            resolution: properties.resolution,
            configuration: const Configuration(
              route: Routes.root,
              repeatAnimations: false,
            ),
          ),
        ),
      );
    });

    test('shows root', () async {
      await driver.waitFor(find.byType('RootPage'));
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
